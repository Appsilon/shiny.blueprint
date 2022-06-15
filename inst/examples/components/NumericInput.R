library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H4("Uncontrolled"),
    NumericInput(
      onValueChange = setInput("uncontrolledNumericInput"),
      intent = "primary"
    ),
    textOutput("uncontrolledNumericInputOutput"),
    H4("Controlled"),
    NumericInput.shinyInput(
      inputId = "controlledNumericInput",
      intent = "primary"
    ),
    textOutput("controlledNumericInputOutput")
  ),
  server = function(input, output) {
    output$uncontrolledNumericInputOutput <- renderText(input$uncontrolledNumericInput)
    output$controlledNumericInputOutput <- renderText(input$controlledNumericInput)
  }
)
