/* eslint-env node */
module.exports = {
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:ava/recommended",
    "plugin:unicorn/recommended",
  ],
  parser: "@typescript-eslint/parser",
  plugins: ["@typescript-eslint", "unicorn", "ava"],
  root: true,
  rules: {
    "no-await-in-loop": "error",
    "unicorn/switch-case-braces": "off",
    "import/no-extraneous-dependencies": "off",
    "unicorn/prefer-node-protocol": "off",
    "import/extensions": "off",
    "@typescript-eslint/naming-convention": "off",
    "unicorn/expiring-todo-comments": "off",
    "unicorn/prefer-logical-operator-over-ternary": "off",
    "unicorn/consistent-destructuring": "off",
    "unicorn/prefer-module": "off",
    "unicorn/prevent-abbreviations": "off",
    "unicorn/consistent-function-scoping": "off",
    "unicorn/prefer-string-replace-all": "off",
  },
  overrides: [
    {
      files: ".ts",
      parserOptions: {
        project: "./tsconfig.eslint.json",
      },
    },
  ],
};
