library(react.blueprint)
library(shiny)

setInput <- function(inputId, accessor = NULL) {
  JS(paste0("x => Shiny.setInputValue('", inputId, "', x", accessor, ")"))
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H4("Uncontrolled"),
    TextArea(
      growVertically = TRUE,
      onChange = setInput(ns("uncontrolledTextarea"), ".target.value"),
      large = TRUE,
      intent = "primary"
    ),
    textOutput(ns("uncontrolledTextareaOutput")),
    H4("Controlled"),
    TextArea.shinyInput(
      inputId = ns("controlledTextarea"),
      growVertically = TRUE,
      large = TRUE,
      intent = "primary"
    ),
    textOutput(ns("controlledTextareaOutput"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$uncontrolledTextareaOutput <- renderText(input$uncontrolledTextarea)
    output$controlledTextareaOutput <- renderText(input$controlledTextarea)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
