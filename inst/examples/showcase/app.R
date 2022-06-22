library(appsilon.blueprint)
library(shiny.router)
library(shiny)

loadComponent <- function(name) {
  module <- new.env()
  source(glue::glue("../components/{name}.R"), local = module)
  module
}

button <- loadComponent("Button")
overflowList <- loadComponent("OverflowList")

menu <- UL(
  tags$li(tags$a(href = route_link("Button"), "Button")),
  tags$li(tags$a(href = route_link("OverflowList"), "OverflowList"))
)

router <- make_router(
  route(
    "Button",
    button$ui("button"),
    function() button$server("button")
  ),
  route(
    "OverflowList",
    overflowList$ui("overflowList"),
    function() overflowList$server("overflowList")
  )
)

style <- tags$head(tags$style(HTML("
  .page {
    display: grid;
    grid-template-columns: 200px minmax(0, 1fr);
    gap: 1em;
  }
")))

shinyApp(
  ui = tagList(
    style,
    tags$div(
      class = "page",
      tags$nav(menu),
      tags$main(router$ui)
    )
  ),
  server = function(input, output) {
    router$server()
  }
)
