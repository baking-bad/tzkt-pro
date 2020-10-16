const Promise = require('bluebird')
const { readFileAsync } = Promise.promisifyAll(require('fs'))
const { exec } = require('shelljs')

const additionalData = require('./data/open-api-additional-data.json')
const tagGroups = require('./data/open-api-tag-groups.json')

describe('make spec', () => {
  it('should generate open api spec as expected', async () => {
    // given ... Postgrest is running as configured correctly

    // when ... we generate open api spec
    exec('make spec')

    // then
    // ... should create json file as expected
    const result = await readFileAsync('openapi.json', 'utf8')
      .then(JSON.parse)
    // ... including no base path
    expect(result).not.toHaveProperty('basePath')
    // ... including no id fields in paths or definitions
    Object.entries(result.paths).forEach(([_, path]) => {
      const parameters = path.get.parameters.map(param => param['$ref'])
      const matches = parameters.map(x => /_id$/.test(x))
      expect(matches).not.toContain(true)
    })
    Object.entries(result.definitions).forEach(([_, definition]) => {
      const properties = Object.keys(definition.properties)
      const matches = properties.map(x => /_id$/.test(x))
      expect(matches).not.toContain(true)
    })
    // ... including generated code samples
    Object.entries(result.paths).forEach(([_, path]) => {
      const codeSamples = path.get['x-codeSamples']
      const codeSampleLangs = path.get['x-codeSamples'].map(codeSample => codeSample.lang)
      // console.log(path.get['x-codeSamples'])
      // console.log(codeSamples)
      expect(codeSamples).toContainEqual(expect.objectContaining({
        lang: expect.any(String),
        source: expect.any(String),
      }))
      expect(codeSampleLangs).toEqual(expect.arrayContaining(['JavaScript', 'Python']))
    })
    // ... including tag groups from provided JSON
    expect(result).toEqual(expect.objectContaining({ 'x-tagGroups': tagGroups }))
    // ... including additional data from provided JSON
    expect(result).toEqual(expect.objectContaining(additionalData))
  })
})
