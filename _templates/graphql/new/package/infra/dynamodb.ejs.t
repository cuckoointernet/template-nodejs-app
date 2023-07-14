---
to: packages/<%= packageName %>/infra/dynamodb.ts
unless_exists: true
---
import * as cdk from "aws-cdk-lib";
import * as dynamodb from "aws-cdk-lib/aws-dynamodb";
import * as AWSConstructs from "@cuckoointernet/aws-constructs";

export class ExampleTable extends AWSConstructs.dynamodb.Table {
  constructor(stack: cdk.Stack) {
    super(stack, ExampleTable.name, {
      billingMode: dynamodb.BillingMode.PAY_PER_REQUEST,
      partitionKey: {
        name: "id",
        type: dynamodb.AttributeType.STRING,
      },
    });
  }
}
