library(shiny)
library(appsilon.blueprint)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    textOutput(ns("clicks")),
    Button(
      onClick = triggerEvent(ns("click1")),
      icon = "refresh",
      "Refresh"
    ),
    Button.shinyInput(
      inputId = ns("click2"),
      rightIcon = "share",
      "Export"
    ),
    AnchorButton(
      onClick = triggerEvent(ns("click3")),
      intent = "primary",
      "OK"
    ),
    AnchorButton.shinyInput(
      inputId = ns("click4"),
      intent = "success",
      "Next"
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    clicks <- reactiveVal(0)
    output$clicks <- renderText(paste("Clicks:", clicks()))
    observeEvent(input$click1, clicks(clicks() + 1))
    observeEvent(input$click2, clicks(clicks() + 1))
    observeEvent(input$click3, clicks(clicks() + 1))
    observeEvent(input$click4, clicks(clicks() + 1))
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
