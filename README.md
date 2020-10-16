# TzKT Pro

## Setup

#### Create `.env` file from ``.env.tpl``

#### Install dependencies

```bash
sudo apt install jq  # or brew install jq
npm i
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

#### Generate Docs Specs (Open API Specification)

```bash
make spec
```

#### View Docs (with Redoc)

```bash
make docs
```

## Code Samples

``make spec`` will generate a ``GET`` code sample for each endpoint using the ``open-api/code-samples/config/gen-code-samples.config.json`` config.  

#### To add a template for a new language:

1. Create a Handlebars template file in ``open-api/code-samples/templates`` eg.
   ```
   open-api/code-samples/templates/javascript.hbs
   ```

2. Update ``open-api/code-samples/config/gen-code-samples.config.json`` config eg.
   ```json
   "JavaScript": "open-api/code-samples/templates/javascript.hbs",
   ```   

3. Now ``make spec`` will generate a ``GET`` code sample for each endpoint using the updated config and Handlebars template  

## Tag Groups

``make spec`` will update ``x-tagGroups`` in the Open API spec it generates using ``open-api/data/open-api-tag-groups.json``

## Testing

To run tests
```json
npm run test
```
or in watch mode
```json
npm run test:watch
```
