library(shiny)
library(appsilon.blueprint)
top5Films <- list(
  list(
    label = "The Shawshank Redemption",
    rightLabel = 1994,
    key = 1
  ),
  list(
    label = "The Godfather",
    rightLabel = 1972,
    key = 2
  ),
  list(
    label = "The Godfather: Part II",
    rightLabel = 1974,
    key = 3
  ),
  list(
    label = "The Dark Knight",
    rightLabel = 2008,
    key = 4
  ),
  list(
    label = "12 Angry Men",
    rightLabel = 1957,
    key = 5
  )
)


ui <- function(id) {
  ns <- NS(id)
  tagList(
    H3("Suggest"),
    Suggest(
      items = top5Films,
      inputId = ns("value1"),
      inputProps = list(
        placeholder = "Search with Suggest..."
      ),
      noResults = MenuItem(
        disabled = TRUE,
        text = "No results"
      )
    ),
    uiOutput(ns("value1Output")),
    H3("Suggest2"),
    Suggest2(
      items = top5Films,
      inputId = ns("value2"),
      inputProps = list(
        placeholder = "Search with Suggest2..."
      ),
      noResults = MenuItem(
        disabled = TRUE,
        text = "No results"
      )
    ),
    uiOutput(ns("value2Output"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$value1Output <- renderText(input$value1$label)
    output$value2Output <- renderText(input$value2$label)
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
