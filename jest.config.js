module.exports = {
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/setup-jest.ts'],
  transform: {
    '^.+\\.(ts|mjs|js|html)$': 'ts-jest'
  },
  moduleFileExtensions: ['ts', 'js', 'html'],
  collectCoverage: true,
  coverageDirectory: 'coverage/jest',
  transformIgnorePatterns: ['node_modules/(?!(?:@angular|rxjs|tslib)/)'],
  globals: {
    'ts-jest': {
      tsconfig: 'tsconfig.spec.json',
      diagnostics: false
    }
  }
};
