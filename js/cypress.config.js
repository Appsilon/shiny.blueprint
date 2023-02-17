const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    baseUrl: "http://localhost:3333",
    defaultCommandTimeout: 1e4,
    supportFile: false,
  },
});
