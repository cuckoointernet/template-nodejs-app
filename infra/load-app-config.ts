import { App } from "aws-cdk-lib";

interface AppConfiguration {
  customer: string;
  environment: string;
  logLevel: string;
  account: string;
  region: string;
}

type Environment = "dev" | "stage" | "prod";

interface EnvironmentConfig {
  logLevel: string;
  account: string;
  region: string;
}

interface CustomerConfig {
  dev?: EnvironmentConfig;
  stage?: EnvironmentConfig;
  prod: EnvironmentConfig;
}

export const loadAppConfig = (app: App): AppConfiguration => {
  const customer = app.node.tryGetContext("CUSTOMER") as string;
  const environment = app.node.tryGetContext("ENVIRONMENT") as Environment;

  if (!customer || !environment) {
    throw new Error(
      "CDK context variables CUSTOMER and/or ENVIRONMENT were not defined"
    );
  }

  const customerConfig = app.node.tryGetContext(customer) as CustomerConfig;
  if (!customerConfig) {
    throw new Error(
      `Cannot find configuration for customer '${customer}' - check entry exists in cdk.context.json`
    );
  }

  const environmentConfig = customerConfig[environment];
  if (!environmentConfig) {
    throw new Error(
      `Cannot find environment configuration '${environment}' for customer '${customer}' - check entry exists in cdk.context.json`
    );
  }

  return {
    customer,
    environment,
    logLevel: environmentConfig.logLevel,
    account: environmentConfig.account,
    region: environmentConfig.region,
  };
};
