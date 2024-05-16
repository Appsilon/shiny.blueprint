library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    Button.shinyInput(
      inputId = ns("showDialog"),
      "Show dialog"
    ),
    reactOutput(ns("dialog"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isOpen <- reactiveVal(FALSE)
    observeEvent(input$showDialog, isOpen(TRUE))
    observeEvent(input$closeDialog, isOpen(FALSE))

    output$dialog <- renderReact({
      Dialog(
        usePortal = FALSE,
        isOpen = isOpen(),
        onClose = triggerEvent(ns("closeDialog")),
        div(
          className = "bp5-dialog-body",
          H5("Analytical applications"),
          tags$p(
            "User interfaces that enable people to interact smoothly with data,",
            " ask better questions, and make better decisions."
          ),
          Button.shinyInput(
            inputId = ns("closeDialog"),
            "Close"
          )
        )
      )
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
