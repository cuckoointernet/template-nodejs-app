---
to: packages/<%= packageName %>/src/core/get-magic/index.ts
---
import { AppSyncResolverHandler } from "aws-lambda";

import { logger } from "../../logger";

// NOTE: Any common reuseable code across our endpoints should be here.
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
