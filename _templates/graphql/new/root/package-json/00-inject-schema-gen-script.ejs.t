---
inject: true
to: package.json
after: scripts
skip_if: generate-graphql-types
---
    "generate-graphql-types": "graphql-codegen",