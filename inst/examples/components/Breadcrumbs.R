library(shiny)
library(appsilon.blueprint)

items <- list(
  list(icon = "folder-close", text = "Users"),
  list(icon = "folder-close", text = "Janet"),
  list(icon = "document", text = "image.jpg")
)

if (interactive()) shinyApp(
  ui = Breadcrumbs(items = items),
  server = function(input, output) {}
)
