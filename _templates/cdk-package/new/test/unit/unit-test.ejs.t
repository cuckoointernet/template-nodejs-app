---
to: packages/<%= packageName %>/test/unit/index.test.ts
---
/**
 * Unit tests should be written to validate (lower level) individual functions. They are *not* typically suited to
 * testing combined units of logic, such as entire lambdas, but rather the individual functions that make up the logic
 * within one. Following this guidance should mean mocking can be kept to a minimum and that they're relatively
 * inexpensive to write and maintain.
 */

describe("<%= packageName %>", () => {
  it.todo("add units tests in this directory");
});
