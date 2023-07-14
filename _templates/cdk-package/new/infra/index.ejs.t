---
to: packages/<%= packageName %>/infra/index.ts
---
/* eslint-disable no-new */

import * as cdk from "aws-cdk-lib";
import { HelloWorld } from "./lambda";
import { ExampleTable } from "./dynamodb";

export class <%= h.changeCase.pascal(packageName) %>Stack extends cdk.Stack {
  constructor(scope: cdk.App, id: string, props: cdk.StackProps) {
    super(scope, id, props);

    const exampleTable = new ExampleTable(this);
    new HelloWorld(this, exampleTable);
  }
}
