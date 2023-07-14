---
to: packages/<%= packageName %>/test/infra/index.test.ts
unless_exists: true
---
/**
 * Because we use the CDK and TypeScript to manage infrastructure, it's possible to have complex logic regarding the
 * creation or configuration of resources. Infrastructure tests are intended to validate any such complexity. Not all
 * packages will necessarily have tests of this type.
 */

describe("<%= packageName %>", () => {
  it.todo("add infrastructure tests in this directory");
});
