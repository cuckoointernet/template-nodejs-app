---
to: packages/<%= packageName %>/jest.config.ts
---
import type { Config } from "@jest/types";

import baseConfig from "../../jest.config";

const config: Config.InitialOptions = {
  ...baseConfig,
};

export default config;
