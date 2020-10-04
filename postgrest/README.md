# Postgrest

## Setup

#### Start services

```bash
make pro-start
```

#### Create Postgres roles, schemas & views

```bash
docker-compose -f docker-compose.pro.yml exec -T db psql -U tzkt tzkt_db < postgrest/tmp.sql
```

#### list endpoints (using HTTPie & JQ)

```bash
http :3000 | jq -c '.paths | keys' | jq
```

#### export OpenAPI spec (using HTTPie & JQ)

```bash
http :3000 | jq . > postgrest/openapi.json
```

#### View OpenAPI specs in Swagger UI

```bash
docker run -p 8888:8080 -e URL=http://localhost:3000/ swaggerapi/swagger-ui
```
or
```bash
docker run -p 8888:8080 -e SWAGGER_JSON=./postgrest/openapi.json swaggerapi/swagger-ui
```
