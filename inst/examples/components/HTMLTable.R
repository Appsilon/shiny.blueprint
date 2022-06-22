library(shiny)
library(appsilon.blueprint)

if (interactive()) shinyApp(
  ui = HTMLTable(
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
  ),
  server = function(input, output) {}
)
