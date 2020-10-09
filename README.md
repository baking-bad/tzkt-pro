# TzKT Pro

## Setup

#### Create `.env` file

```
TZKT_PASSWORD=
POSTGREST_PASSWORD=
```

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

#### Run Redoc

```bash
docker run -p 8080:80 -e SPEC_URL=http://127.0.0.1:3000/ redocly/redoc
```