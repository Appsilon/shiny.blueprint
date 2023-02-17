library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  ButtonGroup(
    Button(icon = "database", "Queries"),
    Button(icon = "function", "Functions"),
    AnchorButton(rightIcon = "caret-down", "Options")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
