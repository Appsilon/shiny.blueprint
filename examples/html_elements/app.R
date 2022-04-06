library(shiny)
library(shiny.react)
library(appsilon.blueprint)

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
    UL(tags$li("test")),
    HTMLTable(
      tags$thead(tags$tr(tags$th("Project"), tags$th("Stack"), tags$th("Contributors"))),
      tags$tbody(
        tags$tr(tags$td("Blueprint"), tags$td("JS React"), tags$td("268")),
        tags$tr(tags$td("TS"), tags$td("JSX"), tags$td("68")),
        tags$tr(tags$td("appsilon.blueprint"), tags$td("R JS"), tags$td("2"))
      ),
      tags$tfoot(tags$tr(tags$td("Total", colspan = 2), tags$td("1508")))
    )
  ),
  server = function(input, output) {}
)
