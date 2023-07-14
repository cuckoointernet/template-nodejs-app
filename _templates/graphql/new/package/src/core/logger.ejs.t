---
to: packages/<%= packageName %>/src/core/logger.ts
---
import { <%= h.changeCase.camel(serviceName) %>Logger } from "../logger";

export const logger = <%= h.changeCase.camel(serviceName) %>Logger.createChildLogger({
  resolver: "core",
});
