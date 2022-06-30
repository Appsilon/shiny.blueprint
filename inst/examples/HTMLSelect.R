library(appsilon.blueprint)
library(shiny)

setInput <- function(inputId, accessor = NULL) {
  JS(paste0("x => Shiny.setInputValue('", inputId, "', x", accessor, ")"))
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H4("Uncontrolled"),
    HTMLSelect(
      options = rownames(mtcars),
      onChange = setInput(ns("uncontrolledHtmlSelect"), ".target.value")
    ),
    textOutput(ns("uncontrolledHtmlSelectOutput")),
    H4("Controlled"),
    HTMLSelect.shinyInput(
      inputId = ns("controlledHtmlSelect"),
      options = rownames(mtcars)
    ),
    textOutput(ns("controlledHtmlSelectOutput"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$uncontrolledHtmlSelectOutput <- renderText(input$uncontrolledHtmlSelect)
    output$controlledHtmlSelectOutput <- renderText(input$controlledHtmlSelect)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
