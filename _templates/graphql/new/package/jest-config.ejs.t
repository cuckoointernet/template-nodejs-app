---
to: packages/<%= packageName %>/jest.config.ts
unless_exists: true
---
import type { Config } from "@jest/types";

import baseConfig from "../../jest.config";

const config: Config.InitialOptions = {
  ...baseConfig,
};

export default config;
