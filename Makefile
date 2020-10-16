include .env
export $(shell sed 's/=.*//' .env)

SHELL := /bin/bash

# urls
POSTGREST_API_URL = 127.0.0.1:3000

# commands
OPEN_API_CMD = bash open-api/main.sh

# config files
CODE_SAMPLES_CONFIG = open-api/code-samples/config/gen-code-samples.config.json
OPEN_API_SPEC = openapi.json

# data
TAG_GROUPS = open-api/data/open-api-tag-groups.json
ADDITIONAL_DATA = open-api/data/open-api-additional-data.json

snapshot:
	docker run --name tzkt-snapshot bakingbad/tzkt-snapshot:latest
	docker cp tzkt-snapshot:/tzkt_db.backup .
	docker rm tzkt-snapshot
	docker rmi bakingbad/tzkt-snapshot

db-start:
	docker-compose up -d db

db-restore:
	docker-compose exec -T db psql -U tzkt postgres -c '\l'
	docker-compose exec -T db dropdb -U tzkt --if-exists tzkt_db
	docker-compose exec -T db createdb -U tzkt -T template0 tzkt_db
	docker-compose exec -T db pg_restore -U tzkt -O -x -v -d tzkt_db -1 < tzkt_db.backup

db-pro:
	docker-compose exec -T db psql -U tzkt postgres -c "DROP USER IF EXISTS postgrest;"
	docker-compose exec -T db psql -U tzkt postgres -c "CREATE USER postgrest WITH PASSWORD '$$POSTGREST_PASSWORD';"
	docker-compose exec -T db psql -U tzkt -d tzkt_db < init.sql

pro-start:
	docker-compose up -d

pro-stop:
	docker-compose down

# Generate Open API specs for Redoc
.PHONY: spec
spec:
	# export and cleanup Open API spec from Postgrest
	@curl $(POSTGREST_API_URL) \
		| $(OPEN_API_CMD) cleanup \
		> openapi.json.tmp

	# generate code examples from spec
	@cat openapi.json.tmp \
		| $(OPEN_API_CMD) gen_code_samples $(CODE_SAMPLES_CONFIG) \
		> openapi-code-samples.json

	# update spec
	# ... merge	in code examples
	# ... associate tag groups
	# ... merge additional data
	@cat openapi.json.tmp \
		| $(OPEN_API_CMD) merge_code_examples openapi-code-samples.json \
		| $(OPEN_API_CMD) assoc_tag_groups $(TAG_GROUPS) \
		| $(OPEN_API_CMD) merge_additional_data $(ADDITIONAL_DATA) \
		> openapi.json

	# cleanup temp files
	@rm openapi.json.tmp
	@rm openapi-code-samples.json

# Serve Open API specs locally on port 8080 using Redoc
.PHONY: docs
docs:
	docker run -p $(REDOC_PORT):80 \
      -v $$(pwd)/$(OPEN_API_SPEC):/usr/share/nginx/html/$(OPEN_API_SPEC) \
      -e SPEC_URL=$(OPEN_API_SPEC) \
      redocly/redoc
