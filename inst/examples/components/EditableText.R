library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = tagList(
    H2(EditableText(onChange = setInput("header"))),
    EditableText.shinyInput(
      inputId = "body",
      multiline = TRUE,
      minLines = 3, maxLines = 12
    ),
    textOutput("headerValue"),
    textOutput("bodyValue")
  ),
  server = function(input, output) {
    output$headerValue <- renderText(paste("Header:", deparse(input$header)))
    output$bodyValue <- renderText(paste("Body:", deparse(input$body)))
  }
)
