library(shiny.blueprint)
library(shiny)

items <- list(
  list(href = "/", icon = "folder-close", text = "Users"),
  list(href = "/", icon = "folder-close", text = "Janet"),
  list(icon = "document", text = "image.jpg")
)

ui <- function(id) {
  Breadcrumbs(items = items)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
