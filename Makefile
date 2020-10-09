include .env
export $(shell sed 's/=.*//' .env)

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
	docker-compose exec -T db psql -U tzkt postgres -c "CREATE USER postgrest WITH PASSWORD '$$POSTGREST_PASSWORD';"
	docker-compose exec -T db psql -U tzkt -d tzkt_db < init.sql

pro-start:
	docker-compose up -d

pro-stop:
	docker-compose down

spec:
	curl 127.0.0.1:3000 > openapi.json