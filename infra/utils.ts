import { APPLICATION_NAME } from "./constants";

export const createId = (component: string, environment: string) =>
  `${APPLICATION_NAME}-${component}-${environment}`;
