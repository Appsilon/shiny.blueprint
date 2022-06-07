library(shiny)
library(appsilon.blueprint)

shinyApp(
  ui = Card(
    interactive = "true",
    H5(tags$a(href = "#", "Analytical applications")),
    tags$p(
      "User interfaces that enable people to interact smoothly with data,",
      " ask better questions, and make better decisions."
    ),
    Button(text = "Explore products")
  ),
  server = function(input, output) {}
)
