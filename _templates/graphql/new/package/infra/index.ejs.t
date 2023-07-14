---
to: packages/<%= packageName %>/infra/index.ts
unless_exists: true
---
/* eslint-disable no-new */

import * as cdk from "aws-cdk-lib";
import { ExampleTable } from "./dynamodb";

export class <%= h.changeCase.pascal(packageName) %>Stack extends cdk.Stack {
  constructor(scope: cdk.App, id: string, props: cdk.StackProps) {
    super(scope, id, props);

    const exampleTable = new ExampleTable(this);

    // TODO: Import & initialise AppSync resources here.
  }
}
