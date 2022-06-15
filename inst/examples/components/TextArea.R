library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H4("Uncontrolled"),
    TextArea(
      growVertically = TRUE,
      onChange = JS("event => Shiny.setInputValue('uncontrolledTextarea', event.target.value)"),
      large = TRUE,
      intent = "primary"
    ),
    textOutput("uncontrolledTextareaOutput"),
    H4("Controlled"),
    TextArea.shinyInput(
      inputId = "controlledTextarea",
      growVertically = TRUE,
      large = TRUE,
      intent = "primary"
    ),
    textOutput("controlledTextareaOutput")
  ),
  server = function(input, output) {
    output$uncontrolledTextareaOutput <- renderText(input$uncontrolledTextarea)
    output$controlledTextareaOutput <- renderText(input$controlledTextarea)
  }
)
