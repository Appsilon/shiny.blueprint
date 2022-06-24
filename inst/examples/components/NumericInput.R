library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H4("Uncontrolled"),
    NumericInput(
      onValueChange = setInput(ns("uncontrolledNumericInput")),
      intent = "primary"
    ),
    textOutput(ns("uncontrolledNumericInputOutput")),
    H4("Controlled"),
    NumericInput.shinyInput(
      inputId = ns("controlledNumericInput"),
      intent = "primary"
    ),
    textOutput(ns("controlledNumericInputOutput"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$uncontrolledNumericInputOutput <- renderText(input$uncontrolledNumericInput)
    output$controlledNumericInputOutput <- renderText(input$controlledNumericInput)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
