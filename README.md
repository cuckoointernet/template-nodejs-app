# ℹ Overview

This is a [template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) for Node.js projects. 
It provides a preconfigured common set of tooling and is the starting point for any new Node.js projects we build. 
Using this template will save you time and also promote a consistent developer experience across repositories.

It's primarily geared towards Node.js + TypeScript + AWS. If this sounds good to you keep on reading!

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

# ✅ Features

- **[TypeScript](https://www.typescriptlang.org/)** for development
- **[AWS CDK](https://aws.amazon.com/cdk/)** and **[AWS Constructs](https://github.com/cuckoointernet/aws-constructs)** for infrastructure as code
- **[Jest](https://jestjs.io/)** for testing
- **[GitHub Actions](https://github.com/features/actions)** for CICD
- **[Lerna](https://github.com/lerna/lerna)** for monorepo management
- **[XO](https://github.com/xojs/xo)** for linting
- **[Prettier](https://prettier.io/)** for formatting (via XO)
- **[Renovate](https://www.whitesourcesoftware.com/free-developer-tools/renovate/)** for automated dependency updates
- **[Lint-staged](https://github.com/okonet/lint-staged)** to lint files before they're committed
- **[Hygen](https://www.hygen.io/)** for generating new packages with a consistent structure
- **Automated versioning and changelog generation** via [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
- **Strict Node & NPM versioning** to match the latest AWS Lambda runtimes
- **Common dev dependencies preinstalled** at root level to avoid duplication across packages
- **PR templates** for consistency

# 👂 Preamble
There are a few conventions when using this repo to be aware of:

1. The CDK [context values](https://docs.aws.amazon.com/cdk/v2/guide/cli.html#w53aac33b7c33c11) `ENVIRONMENT` and `CUSTOMER` declared via the CICD CLI are as follows:
   1. `ENVIRONMENT` - `dev`, `stage` or `prod`
   2. `CUSTOMER` - a string representing the end client of your software. This library is built with a SaaS mindset, where each customer can have their own configuration. If this doesn't apply simply use your own business name
   
2. Your `cdk.context.json` [file](https://docs.aws.amazon.com/cdk/v2/guide/context.html) should adopt a structure of:

```json
{
  "cuckoo": {                  // <--- customer(s)
    "prod": {                  // <--- environment(s)
       "account": "123456789", // <--- option(s)
       "region": "eu-west-1"   
    }
  }
}
```

Where a more complete example might look something like:

```json
{
  "cuckoo": {
    "dev": {
      "logLevel": "debug",
      "account": "123456789",
      "region": "eu-west-1"
    },
    "prod": {
      "logLevel": "info",
      "account": "123456789",
      "region": "eu-west-1"
    }
  },
  "acme": {
    "dev": {
      "logLevel": "info",
      "account": "987654321",
      "region": "us-east-1",
      "alarmNotificationsTopic": "acme-sns-topic-dev",
      "yourCustomOptions": "foo"
    },
    "prod": {
      "logLevel": "error",
      "account": "987654321",
      "region": "us-east-1",
      "alarmNotificationsTopic": "acme-sns-topic-prod",
      "yourCustomOptions": "bar"
    }
  }
}
```


# 🧱 Prerequisites

#### GitHub Bot Account
This template will automatically create [releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) & changelogs when new code is merged in. It does this via a bot account that you supply to it and will need to created beforehand. 

#### GitHub Secrets
These [secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets#about-encrypted-secrets) will need to be made available to the repo you clone from this template:

- `SERVICE_ACCOUNT_TOKEN` - a GitHub access token for a bot account you own (see above)
- `AWS_ACCESS_KEY_ID` - credentials that can be used to deploy resources into your chosen AWS account
- `AWS_SECRET_ACCESS_KEY` - credentials that can be used to deploy resources into chosen your AWS account

# 🔧 Setup

1. Create a new repository for your project from this template by following [these steps](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
2. Substitute placeholder variables in the following files:
   1. `./package.json` [here](https://github.com/cuckoointernet/template-nodejs-app/blob/main/package.json#L2)
   2. `./infra/constants.js` [here](https://github.com/cuckoointernet/template-nodejs-app/blob/main/infra/constants.ts#L1) and [here](https://github.com/cuckoointernet/template-nodejs-app/blob/main/infra/constants.ts#L5)
   3. `./cdk.context.json` [multiple here](https://github.com/cuckoointernet/template-nodejs-app/blob/main/cdk.context.json)
   4. `./.github/workflows/version-changelog.yml` - replace "bot" with your bot account name (see prerequisites) [here](https://github.com/cuckoointernet/template-nodejs-app/blob/main/.github/workflows/version-changelog.yml#L20-L21)
   5. `./.github/workflows/deploy-*` - replace "cuckoo" with your list of customers (see preamble) [here](https://github.com/cuckoointernet/template-nodejs-app/blob/main/.github/workflows/deploy-development.yml#L41), [here](https://github.com/cuckoointernet/template-nodejs-app/blob/main/.github/workflows/deploy-stage.yml#L46) and [here](https://github.com/cuckoointernet/template-nodejs-app/blob/main/.github/workflows/deploy-production.yml#L46)
3. Change the following GitHub repository settings:
   1. Settings > General > Pull Requests - Enable `Automatically delete head branches`
   2. Settings > General > Pull Requests - Enable `Allow squash merging` + `Default to pull request title` (disable other options)
   3. Settings > Branches - Add a [rule](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule) for `main`:
      1. Enable `Require a pull request before merging`
      2. Enable `Require approvals` and set to 1
      3. Enable `Allow specified actors to bypass required pull requests` and add your bot user (see prerequisites)
4. Register your new repository with Renovate via [these steps](https://docs.renovatebot.com/getting-started/installing-onboarding/#hosted-githubcom-app)
5. Familiarise yourself with the structure of the package templates (see [here](https://github.com/cuckoointernet/template-nodejs-app/tree/main/_templates/cdk-package/new) and [here](https://github.com/cuckoointernet/template-nodejs-app/tree/main/_templates/graphql/new))
6. When you're ready to start building your application, add a new package via [`generate` script](#-npm-scripts)

Happy coding! 🙌

# 💻 NPM Scripts
The following scripts are available from the root level of this repository:

 - `install` - install all dependencies across the entire repo
 - `build` - runs the typescript compiler against each monorepo package
 - `clean` - removes all monorepo package dependencies and build files
 - `lint` - runs the linter on the entire repo and automatically fixing errors wherever possible
 - `lint:nofix` - same as `lint` but does not automatically fix errors (faster)*
 - `test` - runs all unit and infrastructure tests
 - `test:integration:dev` - runs all integration tests against the development environment
 - `test:integration:stage` - runs all integration tests against the stage environment
 - `package` - prepares each package for deployment to AWS (removes dev dependencies)*
 - `generate` - initialises a new monorepo package with our standard directory structure
   - available package types are:
     - `cdk-package` - creates a vanilla nodejs cdk application package
     - `graphql` - creates a graphql server (appsync) cdk application package
   - choose which you want via arguments `-- "<generator>" "<name>" "new"`
     - eg: `npm run generate -- "graphql" "new"`

&ast; primarily used by CICD

# 💡 Good to Know
Below are some conventions this repository follows that are good to be aware of:

## 🌐 Environments
- This repository will provision 3 environments for you (dev/stage/prod)
- The development environment is automatically redeployed to whenever a new commit is pushed to an open PR
- This means the development environment is **volatile**. Meaning any push by another dev (or bot) will deploy over your changes
- Given our team size this volatility is not usually an issue
- The stage environment is to be treated as production-like 

## 📦 Monorepo Packages
- The intention is that each package represents a small collection of resources that work together to fulfill some requirement
- This means it should be neither a single lambda or an entire application (somewhere inbetween)
- Generally speaking this strikes a nice balance between boilerplate & complexity
- Each package should be self-contained and **not** import files outside its own directory structure (eg: files from the repo root level or other packages)

## 🚦 Automated Tests

There are three flavours of tests we feel give us confidence our code is operating as expected:  

- Unit tests
- Integration tests
- Infrastructure tests

Our definition of each is as follows:

#### Unit Tests
Unit tests should be written to validate (lower level) individual functions. They are *not* typically suited to testing combined units of logic, such as entire lambdas, but rather the individual functions that make up the logic within one. Following this guidance should mean mocking can be kept to a minimum and that they're relatively inexpensive to write and maintain.

#### Integration Tests
Integration tests should be written to give confidence that deployed resources are functioning together as a combined unit. This means operating against *real* resources in the cloud in a black box fashion, ie: given a starting point, does stuff pop out at the other end as intended.

These tests are typically the most expensive to write and maintain, but also give the **most confidence** that stuff is actually working as the product evolves over time. Because of the complexity involved, usually only core functionality is tested in this way.

#### Infrastructure Tests
Because we use the CDK and TypeScript to manage infrastructure, it's possible to have complex logic regarding the creation or configuration of resources. Infrastructure tests are intended to validate any such complexity. Not all packages will necessarily have tests of this type.

## 📁 Directory structure
Outlined below is the standardised directory structures for each type of package template supported: 

### `cdk-package`

```
.
├── _templates              (hygen templates for new packages)
├── infra                   (repo-level CDK code)
└── packages
    └── <package-name>
        ├── infra           (package-level CDK code)
        ├── src             (application code)
        │   └── types.ts    (shared typescript definitions)
        └── test            (test code)
            ├── infra       (infrastructure tests)
            ├── integration (integration tests)
            └── unit        (unit tests) 
```

### `graphql`

This package follows the `cdk-package` directory structure (see above) with some additional conventions within `src` as outlined below: 

```
.
└── src
    ├── core                            (directory containing any shared logic *agnostic* of API type)
    │   └── <operation-name>            (directory containing logic for one type of operation)                  
    │   
    ├── graphql                         (directory containing any *GraphQL* API specific logic)
    │   ├── schema.graphql              (schema for entire graphql service)
    │   ├── schema.ts                   (typescript definitions automaticaly generated from schema.graphql)
    │   ├── xray.ts                     (import this file into your resolvers to automatically trace HTTP requests with AWS X-Ray)
    │   └── <operation-name>            (directory containing logic for one type of operation)
    │       ├── index.ts                (entry-point resolver for operation)
    │       ├── filter-by.ts            (logic for filtering graphql responses)
    │       └── order-by.ts             (logic for ordering graphql responses)
    │   
    ├── rest                            (directory containing any *RESTful* API specific logic)
    │   
    ├── ???                             (other directories for API types supported in the future)
```

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/sekhavati"><img src="https://avatars.githubusercontent.com/u/16732873?v=4?s=100" width="100px;" alt="Amir Sekhavati"/><br /><sub><b>Amir Sekhavati</b></sub></a><br /><a href="https://github.com/cuckoointernet/template-nodejs-app/commits?author=sekhavati" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/elliotcmassey"><img src="https://avatars.githubusercontent.com/u/30092137?v=4?s=100" width="100px;" alt="Elliot Massey"/><br /><sub><b>Elliot Massey</b></sub></a><br /><a href="https://github.com/cuckoointernet/template-nodejs-app/commits?author=elliotcmassey" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
