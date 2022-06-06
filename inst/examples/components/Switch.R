library(shiny)
library(appsilon.blueprint)

withDefault <- function(x, default) {
  if (is.null(x)) default
  else x
}

shinyApp(
  ui = tagList(
    Switch(
      onChange = JS("(event) => Shiny.setInputValue('animate', event.target.checked)"),
      defaultChecked = TRUE,
      label = "Animate"
    ),
    reactOutput("progress")
  ),
  server = function(input, output) {
    output$progress <- renderReact({
      ProgressBar(animate = withDefault(input$animate, TRUE))
    })
  }
)
