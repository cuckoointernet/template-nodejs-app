---
to: packages/<%= packageName %>/src/hello-world.ts
---
import { Handler } from "aws-lambda";

export const handler: Handler = async (_event) => {
  console.log("Hello world!");
};
