library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    Tag(active = TRUE, "Hello"),
    Tag(active = TRUE, large = TRUE, "Hello"),
    Tag(active = TRUE, round = TRUE, "Hello"),
    Tag(active = FALSE, icon = "home", round = TRUE, large = TRUE, "Hello"),
    Tag(active = TRUE, rightIcon = "home", "Hello"),
    Tag(active = TRUE, round = TRUE, intent = "primary", interactive = TRUE, "Hello"),
    Tag(active = TRUE, round = TRUE, intent = "warning", interactive = TRUE, "Hello"),
    Tag(active = TRUE, round = TRUE, intent = "success", interactive = TRUE, "Hello"),
    Tag(active = TRUE, round = TRUE, intent = "danger", interactive = TRUE, "Hello")
  ),
  server = function(input, output) {}
)
