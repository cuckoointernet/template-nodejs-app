import { App, Tags } from "aws-cdk-lib";
import { createId } from "./utils";
import { BASE_TAGS } from "./constants";
import { loadAppConfig } from "./load-app-config";

const app = new App();
const appConfig = loadAppConfig(app);

Tags.of(app).add("Environment", appConfig.environment);
Tags.of(app).add("Customer", appConfig.customer);
for (const [tagKey, tagValue] of Object.entries(BASE_TAGS)) {
  Tags.of(app).add(tagKey, tagValue);
}

const env = {
  account: appConfig.account,
  region: appConfig.region,
};

/*
  Add your stack's here when they're ready to be deployed, eg:

  new ExampleStack(app, createId(ExampleStack.name, appConfig.environment), {
    env,
    tags: { Component: "example" },
  });
 */

app.synth();
