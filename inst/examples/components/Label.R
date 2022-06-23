library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  Label(
    "Label",
    tags$input(class = "bp4-input")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
