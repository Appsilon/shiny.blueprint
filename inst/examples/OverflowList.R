library(shiny.blueprint)
library(shiny)

boxStyle <- tags$style("
  .box {
    margin: 0.5em;
    padding: 0.5em;
    background: silver;
    font-size: 4em;
  }
")

items <- lapply(
  list("Too", "many", "words", "to", "fit", "on", "your", "screen!"),
  function(text) div(text, class = "box")
)

ui <- function(id) {
  tagList(
    boxStyle,
    OverflowList(
      items = items,
      visibleItemRenderer = JS("item => item"),
      overflowRenderer = JS("items => null"),
      collapseFrom = "end"
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
