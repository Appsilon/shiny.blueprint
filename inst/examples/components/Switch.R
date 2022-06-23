library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  tagList(
    Switch(
      onChange = JS("(event) => Shiny.setInputValue('apples', event.target.checked)"),
      defaultChecked = TRUE,
      label = "Apples"
    ),
    Switch.shinyInput(
      inputId = "bananas",
      value = TRUE,
      label = "Bananas"
    ),
    textOutput("applesEnabled"),
    textOutput("bananasEnabled")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$applesEnabled <- renderText(paste("Apples:", deparse(input$apples)))
    output$bananasEnabled <- renderText(paste("Bananas:", deparse(input$bananas)))
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
