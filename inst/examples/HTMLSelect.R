library(shiny.blueprint)
library(shiny)

setInput <- function(inputId, accessor = NULL) {
  JS(paste0("x => Shiny.setInputValue('", inputId, "', x", accessor, ")"))
}

options <- list(
  list(value = "a", label = "Apples"),
  list(value = "b", label = "Bananas"),
  list(value = "c", label = "Cherries")
)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    HTMLSelect(
      onChange = setInput(ns("choice1"), ".target.value"),
      options = options
    ),
    textOutput(ns("text1")),
    br(),
    HTMLSelect.shinyInput(
      inputId = ns("choice2"),
      value = "b",
      options = options
    ),
    textOutput(ns("text2"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$text1 <- renderText(deparse(input$choice1))
    output$text2 <- renderText(deparse(input$choice2))
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
