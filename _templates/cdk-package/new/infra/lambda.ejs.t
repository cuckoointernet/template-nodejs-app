---
to: packages/<%= packageName %>/infra/lambda.ts
---
/* eslint-disable unicorn/prefer-module */

import * as path from "node:path";
import * as cdk from "aws-cdk-lib";
import * as lambda from "aws-cdk-lib/aws-lambda";
import * as AWSConstructs from "@cuckoointernet/aws-constructs";
import { ExampleTable } from "./dynamodb";

export class HelloWorld extends AWSConstructs.lambda.Function {
  constructor(stack: cdk.Stack, exampleTable: ExampleTable) {
    super(stack, HelloWorld.name, {
      handler: "hello-world.handler",
      code: lambda.Code.fromAsset(path.join(__dirname, "../build")),
    });

    exampleTable.grantWriteData(this);
  }
}
