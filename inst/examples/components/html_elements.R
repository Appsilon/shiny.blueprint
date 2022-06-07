library(shiny)
library(appsilon.blueprint)

shinyApp(
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
    UL(tags$li("UL")),
    HTMLTable(
      tags$thead(
        tags$tr(tags$th("Project"), tags$th("Stack"), tags$th("Contributors"))
      ),
      tags$tbody(
        tags$tr(tags$td("Blueprint"), tags$td("JS React"), tags$td("268")),
        tags$tr(tags$td("TS"), tags$td("JSX"), tags$td("68")),
        tags$tr(tags$td("appsilon.blueprint"), tags$td("R JS"), tags$td("2"))
      ),
      tags$tfoot(
        tags$tr(tags$td("Total", colspan = 2), tags$td("1508"))
      )
    )
  ),
  server = function(input, output) {}
)
