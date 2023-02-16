library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    Button.shinyInput(
      inputId = ns("showAlert"),
      "Show alert"
    ),
    reactOutput(ns("alert"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isOpen <- reactiveVal(FALSE)
    observeEvent(input$showAlert, isOpen(TRUE))
    observeEvent(input$closeAlert, isOpen(FALSE))

    output$alert <- renderReact({
      Alert(
        usePortal = FALSE,
        confirmButtonText = "Got it",
        isOpen = isOpen(),
        onClose = triggerEvent(ns("closeAlert")),
        p("Hello, it's me, your alert")
      )
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
