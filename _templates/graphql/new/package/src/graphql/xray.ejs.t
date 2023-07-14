---
to: packages/<%= packageName %>/src/graphql/xray.ts
---
// Import this file into your resolvers to automatically trace HTTP requests with AWS X-Ray
import http from "node:http";
import https from "node:https";
import AWSXRay from "aws-xray-sdk-core";

AWSXRay.captureHTTPsGlobal(http);
AWSXRay.captureHTTPsGlobal(https);

export { default } from "aws-xray-sdk-core";
