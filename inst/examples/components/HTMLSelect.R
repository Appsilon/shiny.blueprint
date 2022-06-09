library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H4("Uncontrolled"),
    HTMLSelect(
      options = rownames(mtcars)
    ),
    H4("Controlled"),
    HTMLSelect.shinyInput(
      inputId = "htmlSelect",
      options = rownames(mtcars)
    ),
    textOutput("htmlSelectOutput")
  ),
  server = function(input, output) {
    output$htmlSelectOutput <- renderText(input$htmlSelect)
  }
)
