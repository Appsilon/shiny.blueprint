library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  tagList(
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
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$uncontrolledHtmlSelectOutput <- renderText(input$uncontrolledHtmlSelect)
    output$controlledHtmlSelectOutput <- renderText(input$controlledHtmlSelect)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
