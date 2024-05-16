library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  Label(
    "Label",
    tags$input(class = "bp5-input")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
