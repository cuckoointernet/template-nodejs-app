---
to: packages/<%= packageName %>/infra/appsync.ts
unless_exists: true
---
/* eslint-disable unicorn/prefer-module */
import * as path from "node:path";
import { Construct } from "constructs";
import * as appsync from "aws-cdk-lib/aws-appsync";
import * as lambda from "aws-cdk-lib/aws-lambda";
import * as cognito from "aws-cdk-lib/aws-cognito";
import * as waf from "aws-cdk-lib/aws-wafv2";
import { utils } from "@cuckoointernet/aws-constructs";

interface <%= h.changeCase.pascal(serviceName) %>GraphqlApiProps {
  dataSources: {
    getHelloWorld: lambda.IFunction;
  };
  authorizationProviders: {
  };
}

export class <%= h.changeCase.pascal(serviceName) %>GraphqlApi extends appsync.GraphqlApi {
  constructor(scope: Construct, props: <%= h.changeCase.pascal(serviceName) %>GraphqlApiProps) {
    const environment = scope.node.tryGetContext("ENVIRONMENT") as string;
    const customer = scope.node.tryGetContext("CUSTOMER") as string;
    const userPoolArn = utils.getContextByPath(
      scope,
      `${customer}.${environment}.userPool`
    ) as string | undefined;

    if (!userPoolArn) {
      throw new Error(
        `Cannot find value for ${customer}.${environment}.userPool in cdk.context.json`
      );
    }

    super(scope, <%= h.changeCase.pascal(serviceName) %>GraphqlApi.name, {
      name: `<%= h.changeCase.paramCase(serviceName) %>-${environment}`,
      schema: appsync.Schema.fromAsset(
        path.join(__dirname, "../src/graphql/schema.graphql")
      ),
      xrayEnabled: true,
      logConfig: {
        excludeVerboseContent: false,
        fieldLogLevel: appsync.FieldLogLevel.ERROR,
      },
    });

    // const wafArn = utils.getContextByPath(
    //   scope,
    //   `${customer}.${environment}.waf`
    // ) as string | undefined;

    // if (!wafArn) {
    //   throw new Error(
    //     `Cannot find value for ${customer}.${environment}.waf in cdk.context.json`
    //   );
    // }

    // new waf.CfnWebACLAssociation(
    //   scope,
    //   `${<%= h.changeCase.pascal(serviceName) %>GraphqlApi.name}WafAssociation`,
    //   {
    //     resourceArn: this.arn,
    //     webAclArn: wafArn,
    //   }
    // );

    this.createResolver({
      typeName: "Query",
      fieldName: "getHelloWorld",
      dataSource: this.addLambdaDataSource(
        "getHelloWorld",
        props.dataSources.getHelloWorld
      ),
    });
  }
}
