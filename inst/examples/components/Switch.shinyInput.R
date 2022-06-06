library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = tagList(
    Switch.shinyInput(
      inputId = "animate",
      value = TRUE,
      label = "Animate"
    ),
    reactOutput("progress")
  ),
  server = function(input, output) {
    output$progress <- renderReact({
      ProgressBar(animate = input$animate)
    })
  }
)
