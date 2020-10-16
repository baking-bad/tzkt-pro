const config = {
  testEnvironment: 'node',
  transform: {
    '^.+\\.js?$': 'babel-jest',
  },
  roots: [
    '<rootDir>/open-api',
  ],
  testMatch: ['**/*.test.js'],
}

module.exports = config
