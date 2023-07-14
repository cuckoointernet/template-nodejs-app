---
to: packages/<%= packageName %>/test/integration/index.test.ts
---
/**
 * Integration tests should be written to give confidence that deployed resources are functioning together as a combined
 * unit. This means operating against *real* resources in the cloud in a black box fashion, ie: given a starting point,
 * does stuff pop out at the other end as intended.
 *
 * These tests are typically the most expensive to write and maintain, but also give the most confidence that stuff is
 * actually working as the product evolves over time. Because of the complexity involved, usually only core
 * functionality is tested in this way.
 */

describe("<%= packageName %>", () => {
  it.todo("add integration tests in this directory");
});
