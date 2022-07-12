library(shiny)
library(appsilon.blueprint)

top5Films <- list(
  list(
    title = "The Shawshank Redemption",
    year = 1994,
    rank = 1
  ),
  list(
    title = "The Godfather",
    year = 1972,
    rank = 2
  ),
  list(
    title = "The Godfather: Part II",
    year = 1974,
    rank = 3
  ),
  list(
    title = "The Dark Knight",
    year = 2008,
    rank = 4
  ),
  list(
    title = "12 Angry Men",
    year = 1957,
    rank = 5
  )
)

SelectExample <- function(...) {
  shiny.react::reactElement(
    module = "exampleApp",
    name = "SelectExample",
    props = shiny.react::asProps(...)
  )
}

Select2Example <- function(...) {
  shiny.react::reactElement(
    module = "exampleApp",
    name = "Select2Example",
    props = shiny.react::asProps(...)
  )
}

addResourcePath("static", "./js-helpers")

ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$script(src = "static/utils.js"),
    tags$script(src = "static/Select.js"),
    H3("Select"),
    SelectExample(
      items = top5Films,
      onSelect = setInput(ns("value1"))
    ),
    uiOutput(ns("value1Output")),
    H3("Select2"),
    Select2Example(
      items = top5Films,
      onSelect = setInput(ns("value2"))
    ),
    uiOutput(ns("value2Output"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$value1Output <- renderText(input$value1$title)
    output$value2Output <- renderText(input$value2$title)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
