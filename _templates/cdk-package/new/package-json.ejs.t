---
to: packages/<%= packageName %>/package.json
---
{
  "name": "<%= packageName %>",
  "private": true,
  "license": "UNLICENSED",
  "version": "0.1.0",
  "engines": {
    "node": "^18.14.0",
    "npm": "9.x"
  },
  "scripts": {
    "build": "tsc",
    "test": "LOG_LEVEL=silent jest --verbose --testPathIgnorePatterns=/test/integration/",
    "test:integration": "LOG_LEVEL=silent jest --verbose --testPathPattern=/test/integration/ --runInBand --passWithNoTests",
    "test:integration:dev": "ENVIRONMENT=dev npm run test:integration",
    "test:integration:stage": "ENVIRONMENT=stage npm run test:integration",
    "clean": "rimraf ./build ./coverage",
    "prepackage": "npm run build && npm prune --production",
    "package": "cp -R ./node_modules ./build || :"
  }
}
