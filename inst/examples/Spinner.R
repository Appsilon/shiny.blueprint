library(react.blueprint)
library(shiny)

ui <- function(id) {
  Spinner(intent = "primary", size = 100)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
