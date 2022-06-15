library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H4("Uncontrolled"),
    HTMLSelect(
      options = rownames(mtcars),
       onChange = JS("(event) => Shiny.setInputValue('uncontrolledHtmlSelect', event.target.value)")
    ),
    textOutput("uncontrolledHtmlSelectOutput"),
    H4("Controlled"),
    HTMLSelect.shinyInput(
      inputId = "controlledHtmlSelect",
      options = rownames(mtcars)
    ),
    textOutput("controlledHtmlSelectOutput")
  ),
  server = function(input, output) {
    output$uncontrolledHtmlSelectOutput <- renderText(input$uncontrolledHtmlSelect)
    output$controlledHtmlSelectOutput <- renderText(input$controlledHtmlSelect)
  }
)
