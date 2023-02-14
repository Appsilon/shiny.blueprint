library(shiny)
library(appsilon.blueprint)

top5Films <- list(
  list(
    text = "The Shawshank Redemption",
    label = 1994
  ),
  list(
    text = "The Godfather",
    label = 1972
  ),
  list(
    text = "The Godfather: Part II",
    label = 1974
  ),
  list(
    text = "The Dark Knight",
    label = 2008
  ),
  list(
    text = "12 Angry Men",
    label = 1957
  )
)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    H3("Multiselect"),
    MultiSelect.shinyInput(
      inputId = ns("multiselect"),
      items = paste("Option", LETTERS),
      selected = c("Option B", "Option E"),
      tagInputProps = list(
        tagProps = list(
          intent = "danger"
        )
      )
    ),
    uiOutput(ns("multiselect_output")),
    H3("Multiselect with labels"),
    MultiSelect.shinyInput(
      inputId = ns("multiselect_lab"),
      items = top5Films,
      selected = c("12 Angry Men", "The Godfather")
    ),
    uiOutput(ns("multiselect_lab_output"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$multiselect_output <- renderText({
      paste(
        purrr::map_chr(input$multiselect[[1]], ~ .x$text),
        collapse = ", "
      )
    })

    output$multiselect_lab_output <- renderText({
      paste(
        purrr::map_chr(input$multiselect_lab[[1]], ~ .x$text),
        collapse = ", "
      )
    })
  })
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
