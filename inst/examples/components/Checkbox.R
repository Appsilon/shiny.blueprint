library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    Checkbox(
      onChange = JS("(event) => Shiny.setInputValue('apples', event.target.checked)"),
      defaultChecked = TRUE,
      label = "Apples"
    ),
    Checkbox.shinyInput(
      inputId = "bananas",
      value = TRUE,
      label = "Bananas"
    ),
    textOutput("applesEnabled"),
    textOutput("bananasEnabled")
  ),
  server = function(input, output) {
    output$applesEnabled <- renderText(paste("Apples:", deparse(input$apples)))
    output$bananasEnabled <- renderText(paste("Bananas:", deparse(input$bananas)))
  }
)
