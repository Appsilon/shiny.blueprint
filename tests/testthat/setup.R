#' @param component Function, returns the component to test
#' @param update Function, updates the component
serverUpdateApp <- function(
  component = \() { },
  update = \(session) { }
) {
  shinytest2::AppDriver$new(
    shiny::shinyApp(
      ui = shiny::fluidPage(
        shiny::actionButton("trigger", "Trigger"),
        component()
      ),
      server = function(input, output, session) {
        shiny::observeEvent(input$trigger, update(session))
      }
    )
  )
}

#' @param inputId The ID of the tested component
#' @param driver shinytest2::AppDriver of the test app
serverUpdateActions <- function(inputId, driver) {
  list(
    update = function() {
      driver$click("trigger")
    },
    getValue = function() {
      driver$get_value(input = inputId)
    }
  )
}
