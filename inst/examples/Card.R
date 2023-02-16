library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  Card(
    interactive = TRUE,
    H5(tags$a(href = "#", "Analytical applications")),
    tags$p(
      "User interfaces that enable people to interact smoothly with data,",
      " ask better questions, and make better decisions."
    ),
    Button(text = "Explore products")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
