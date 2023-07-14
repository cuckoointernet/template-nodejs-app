---
to: packages/<%= packageName %>/tsconfig.json
unless_exists: true
---
{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "rootDir": "./src",
    "outDir": "./build",
  }
}
