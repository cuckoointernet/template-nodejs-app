/* eslint-disable unicorn/prefer-module */
// See types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//

module.exports = [
  {
    type: "input",
    name: "serviceName",
    message: "Enter the name for your service, in `xyz-service` pattern.",
    initial: "example-service",
    validate(value) {
      if (value && !value.includes("-service")) {
        return "WARNING! `service name` should match the pattern `*-service`.";
      }

      return true;
    },
  },
  {
    type: "input",
    name: "packageName",
    message:
      "Enter a name for your package, defaults to `api` - press enter to move on.",
    initial: "api",
  },
];
