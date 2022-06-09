library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H4("Uncontrolled"),
    TextArea(
      growVertically = TRUE,
      large = TRUE,
      intent = "primary"
    ),
    H4("Controlled"),
    TextArea.shinyInput(
      inputId = "textarea",
      growVertically = TRUE,
      large = TRUE,
      intent = "primary"
    ),
    textOutput("textareaOutput")
  ),
  server = function(input, output) {
    output$textareaOutput <- renderText(input$textarea)
  }
)
