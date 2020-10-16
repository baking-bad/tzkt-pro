#!/usr/bin/env node
'use strict'
const Promise = require('bluebird')

const { generateCodeSamples } = require('./gen-code-samples.utils')

const { stdin, stdout, argv } = process

const stdinAsync = () => new Promise((resolve, reject) => {
  let result = ''
  stdin.resume()
  stdin.setEncoding('utf8')
  stdin.on('data', (chunk) => {
    result += chunk
  })
  stdin.on('end', () => resolve(result))
  stdin.on('error', () => reject('error reading stdin'))
})

const args = argv.slice(2)

stdinAsync()
  .then(JSON.parse)
  .then(generateCodeSamples(...args))
  .then(x => JSON.stringify(x, null, 2))
  .tap(x => stdout.write(x))
