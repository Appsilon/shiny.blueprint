library(react.blueprint)
library(shiny)

items <- list(
  list(icon = "folder-close", text = "Users"),
  list(icon = "folder-close", text = "Janet"),
  list(icon = "document", text = "image.jpg")
)

ui <- function(id) {
  Breadcrumbs(items = items)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
