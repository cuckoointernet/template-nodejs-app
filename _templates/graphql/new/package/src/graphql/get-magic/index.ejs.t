---
to: packages/<%= packageName %>/src/graphql/get-magic/index.ts
---
/* eslint-disable-next-line import/no-unassigned-import */
import "../xray";
import { AppSyncResolverHandler } from "aws-lambda";

// import { SomeType } from "../schema";
import { logger } from "./logger";


export const handler: AppSyncResolverHandler<any, any> = async (event) => {
  logger.info("Processing magic request", {
    event,
  });
  try {
    logger.info("Internal magic", {
      event,
    });
    return;
  } catch (error: unknown) {
    logger.error("An unexpected error occurred", {
      err: error,
      event,
    });
    throw error;
  }
};
