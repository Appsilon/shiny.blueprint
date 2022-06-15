library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = tagList(
    H1("H1"),
    H2("H2"),
    H3("H3"),
    H4("H4"),
    H5("H5"),
    H6("H6"),
    Blockquote("Blockquote"),
    Code("Code"),
    Label("Label"),
    Pre("Pre"),
    OL(tags$li("OL")),
    UL(tags$li("UL"))
  ),
  server = function(input, output) {}
)
