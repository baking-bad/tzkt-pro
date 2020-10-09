# TzKT Pro

## Setup

#### Download latest TzKT snapshot

```bash
make snapshot
```

#### Run database and apply snapshot

```bash
make db-start  # wait for container is up and running
make db-restore
```

#### Create Postgres roles, schemas & views

```bash
make db-pro
```

#### Run the indexer and postgrest gateway

```bash
make pro-start
```

#### list endpoints (using HTTPie & JQ)

```bash
http :3000 | jq -c '.paths | keys' | jq
```

#### Update OpenAPI spec

```bash
make spec
```
