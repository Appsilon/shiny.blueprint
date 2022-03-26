library(shiny)
library(shiny.react)
library(shiny.blueprint)

shinyApp(
  ui = tagList(
    H1("Title"),
    H2("Title"),
    H3("Title"),
    H4("Title"),
    H5("Title"),
    H6("Title"),
    Blockquote("test"),
    Code("test"),
    Label("test"),
    Pre("test"),
    OL(tags$li("test")),
    UL(tags$li("test"))
  ),
  server = function(input, output) {}
)
