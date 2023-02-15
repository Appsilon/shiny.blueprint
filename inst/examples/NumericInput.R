library(shiny)
library(react.blueprint)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    NumericInput(
      onValueChange = setInput(ns("value1")),
      intent = "primary"
    ),
    textOutput(ns("value1Output")),
    NumericInput.shinyInput(
      inputId = ns("value2"),
      intent = "primary"
    ),
    textOutput(ns("value2Output"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$value1Output <- renderText(input$value1)
    output$value2Output <- renderText(input$value2)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
