module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: ["eslint:recommended", "plugin:react/recommended"],
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: "latest",
    sourceType: "module",
  },
  plugins: ["react"],
  rules: {
    "no-constant-condition": ["error", { checkLoops: false }],
    "no-unused-vars": ["error", { argsIgnorePattern: "^_" }]
  },
  globals: {
    Shiny: true,
  },
};
