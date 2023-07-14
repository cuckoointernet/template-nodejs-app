---
to: packages/<%= packageName %>/src/logger.ts
---
import { Logger } from "@cuckoointernet/logger-nodejs";

export const <%= h.changeCase.camel(serviceName) %>Logger = new Logger("<%= h.changeCase.paramCase(serviceName) %>");
