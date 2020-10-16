const Handlebars = require('handlebars')
const Promise = require('bluebird')
const { readFileAsync } = Promise.promisifyAll(require('fs'))

const {
  ERROR_INVALID_OPEN_API_SPEC,
  ERROR_INVALID_CONFIG_FILEPATH,
  ERROR_INVALID_CONFIG,
  ERROR_INVALID_TEMPLATE_FILEPATH,
  ERROR_INVALID_TEMPLATE,
} = require('./gen-code-samples.constants')

const extractTableNames = spec => {
  if (!spec.hasOwnProperty('definitions')) {
    return Promise.reject(new Error(ERROR_INVALID_OPEN_API_SPEC));
  }
  return Object.keys(spec.definitions)
}

const loadConfig = configFilepath => readFileAsync(configFilepath, 'utf8')
  .catch(() => Promise.reject(new Error(ERROR_INVALID_CONFIG_FILEPATH)))
  .then(JSON.parse)
  .catch(() => Promise.reject(new Error(ERROR_INVALID_CONFIG)))

// load each template using config
// and return compiled handlebar template function for each lang/template
const compileTemplates = config => Promise
  .map(Object.entries(config), ([lang, tplFilepath]) => readFileAsync(tplFilepath, 'utf8')
    .catch(() => Promise.reject(new Error(ERROR_INVALID_TEMPLATE_FILEPATH)))
    .then(tplSource => [lang, Handlebars.compile(tplSource)])
    .catch(() => Promise.reject(new Error(ERROR_INVALID_TEMPLATE))))

// output sample for each table name and each template
const buildOutput = (tableNames, templates) => tableNames
  .reduce((acc, tableName) => ({
    ...acc,
    [`/${tableName}`]: templates.map(([lang, template]) => ({
      lang,
      source: template({
        table_name: tableName,
        client_url: process.env.CODE_SAMPLE_CLIENT_URL,
        auth: process.env.CODE_SAMPLE_AUTH,
      }),
    }))
  }), {})

module.exports.generateCodeSamples = configFilepath => (spec) => {
  // extract table names from spec
  const tableNames = extractTableNames(spec)

  // generate code samples
  return loadConfig(configFilepath)
    .then(compileTemplates)
    .then((templates) => buildOutput(tableNames, templates))
}
