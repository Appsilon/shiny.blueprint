library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    Button.shinyInput(
      inputId = ns("showMultistepDialog"),
      "Show multistep dialog"
    ),
    reactOutput(ns("multistepDialog"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isOpen <- reactiveVal(FALSE)
    observeEvent(input$showMultistepDialog, isOpen(TRUE))
    observeEvent(input$closeMultistepDialog, isOpen(FALSE))

    output$multistepDialog <- renderReact({
      MultistepDialog(
        usePortal = FALSE,
        isOpen = isOpen(),
        title = "Multistep dialog",
        onClose = triggerEvent(ns("closeMultistepDialog")),
        DialogStep(
          id = "step1",
          panel = div(
            className = "bp4-dialog-body",
            p("This is a step 1")
          ),
          title = "Step 1"
        ),
        DialogStep(
          id = "step2",
          panel = div(
            className = "bp4-dialog-body",
            p("This is a step 2")
          ),
          title = "Step 2"
        ),
        DialogStep(
          id = "step3",
          panel = div(
            className = "bp4-dialog-body",
            p("This is a step 3")
          ),
          title = "Step 3"
        )
      )
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
