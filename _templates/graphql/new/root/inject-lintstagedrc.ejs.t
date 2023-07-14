---
inject: true
to: .lintstagedrc.json
after: \{
skip_if: schema.graphql
---
  "schema.graphql": [
    "npm run generate-graphql-types",
    "npm run lint -- ./packages/<%= packageName %>/src/graphql/schema.ts",
    "prettier --write ./packages/<%= packageName %>/src/graphql/schema.graphql",
    "git add ./packages/<%= packageName %>/src/graphql/schema.ts"
  ],