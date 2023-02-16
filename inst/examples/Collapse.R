library(shiny.blueprint)
library(shiny)

logs <- Pre(
  "[11:53:30] Finished 'typescript-bundle-blueprint' after 769 ms\n",
  "[11:53:30] Starting 'typescript-typings-blueprint'...\n",
  "[11:53:30] Finished 'typescript-typings-blueprint' after 198 ms\n",
  "[11:53:30] write ./blueprint.css\n",
  "[11:53:30] Finished 'sass-compile-blueprint' after 2.84 s\n"
)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    Button.shinyInput(ns("toggle"), "Toggle logs"),
    reactOutput(ns("ui"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    show <- reactiveVal(FALSE)
    observeEvent(input$toggle, show(!show()))
    output$ui <- renderReact({
      Collapse(isOpen = show(), logs)
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
