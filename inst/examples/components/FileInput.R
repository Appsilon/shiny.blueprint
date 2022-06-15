library(shiny)
library(appsilon.blueprint)

library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H4("Uncontrolled"),
    FileInput(
      onChange = JS("event => Shiny.setInputValue('uncontrolledFileInput', event.target.value)"),
      text = "Please, choose a file...",
    ),
    textOutput("uncontrolledFileinputOutput"),
    H4("Controlled"),
    FileInput.shinyInput(
      inputId = "controlledFileInput",
      value = "Please, choose a file..."
    ),
    textOutput("controlledFileinputOutput")
  ),
  server = function(input, output) {
    output$uncontrolledFileinputOutput <- renderText(input$uncontrolledFileInput)
    output$controlledFileinputOutput <- renderText(input$controlledFileInput)
  }
)
