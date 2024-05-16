library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  reactOutput(ns("ui"))
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isOpen <- reactiveVal(FALSE)
    observeEvent(input$hello, isOpen(TRUE))
    observeEvent(input$dismiss, isOpen(FALSE))

    output$ui <- renderReact({
      Popover(
        isOpen = isOpen(),
        Button.shinyInput(ns("hello"), "Say Hello", intent = "primary"),
        usePortal = FALSE,
        content = tags$div(
          style = "padding: 1em",
          H5("Hello!"),
          tags$p("Please read this message."),
          Button.shinyInput(ns("dismiss"), "Dismiss")
        )
      )
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
