library(appsilon.blueprint)
library(shiny)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H3("Simple toasts"),
    ButtonGroup(
      Button.shinyInput(
        inputId = ns("toastDanger"),
        "Danger",
        intent = "danger"
      ),
      Button.shinyInput(
        inputId = ns("toastWarning"),
        "Warning",
        intent = "warning"
      ),
      Button.shinyInput(
        inputId = ns("toastSuccess"),
        "Success",
        intent = "success"
      ),
      Button.shinyInput(
        inputId = ns("toastPrimary"),
        "Primary",
        intent = "primary"
      )
    ),
    H3("Another toaster"),
      Button.shinyInput(
        inputId = ns("anotherToastDanger"),
        "Another danger",
        intent = "danger"
      ),
    H3("Progress"),
    Button.shinyInput(
      inputId = ns("toastProgress"),
      "Progress",
      intent = "primary"
    ),
    H3("Clear all"),
    Button.shinyInput(
      inputId = ns("clearAllToasts"),
      "Clear all",
      intent = "primary"
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    toaster <- Toaster$new(position = "top")
    anotherToaster <- Toaster$new(position = "bottom", maxToasts = 3, toasterId = "newId")

    observeEvent(input$toastDanger, {
      toaster$show(message = "Danger!", intent = "Danger")
    })
    observeEvent(input$toastWarning, {
      toaster$show(message = "Warning!", intent = "warning", icon = "warning-sign")
    })
    observeEvent(input$toastSuccess, {
      toaster$show(message = "Success!", intent = "Success", icon = "hand")
    })
    observeEvent(input$toastPrimary, {
      toaster$show(message = "Primary!", intent = "primary")
    })

    observeEvent(input$anotherToastDanger, {
      anotherToaster$show(message = "Another danger!", intent = "Danger")
    })

    observeEvent(input$clearAllToasts, {
      toaster$clear()
      anotherToaster$clear()
    })

    counter <- 0

    doRun <- reactiveVal(FALSE)
    observeEvent(input$toastProgress, {
      counter <<- 0
      doRun(TRUE)
    })

    observe({
      req(doRun())
      if (counter <= 100) {
        toaster$show(message = counter, intent = "primary", key = 1)
        counter <<- counter + 1
        invalidateLater(10)
      } else {
        toaster$show(message = "Completed!", intent = "success", key = 1)
        doRun(FALSE)
      }
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
