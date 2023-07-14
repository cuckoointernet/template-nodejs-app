---
to: packages/<%= packageName %>/src/graphql/get-magic/logger.ts
---
import { <%= h.changeCase.camel(serviceName) %>Logger } from "../../logger";

export const logger = <%= h.changeCase.camel(serviceName) %>Logger.createChildLogger({
  resolver: "get-magic",
});
