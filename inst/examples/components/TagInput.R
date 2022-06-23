library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  # TagInput must be controlled
  ui = tagList(
    TagInput.shinyInput(
      inputId = "controlledTagInput",
      value = c("one", "two", "three")
    ),
    textOutput("controlledTagInputOutput")
  ),
  server = function(input, output) {
    output$controlledTagInputOutput <- renderText(input$controlledTagInput)
  }
)
