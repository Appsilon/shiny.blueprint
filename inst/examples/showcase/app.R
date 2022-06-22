library(appsilon.blueprint)
library(shiny.router)
library(shiny)

section <- function(name, ...) list(name = name, items = list(...))
item <- function(name, id) list(type = "item", name = name, id = id)

sections <- list(
  section(
    "COMPONENTS",
    item("Button", "Button"),
    item("Overflow list", "OverflowList")
  )
)
items <- do.call(c, lapply(sections, `[[`, "items"))

makeNav <- function(sections) {
  lapply(sections, function(section) {
    tagList(
      H6(section$name),
      UL(lapply(section$items, function(item) {
        tags$li(
          tags$a(item$name, href = route_link(item$id))
        )
      }))
    )
  })
}

readExample <- function(id) {
  path <- glue::glue("../components/{id}.R")
  code <- readChar(path, file.info(path)$size)
  module <- new.env()
  source(path, local = module)
  list(code = code, ui = module$ui, server = module$server)
}

makePage <- function(name, ui, code) {
  tagList(
    H1(name),
    H3("Example"),
    ui,
    H3("Code"),
    Pre(code)
  )
}

makeRouter <- function(items) {
  routes <- lapply(items, function(item) {
    example <- readExample(item$id)
    route(
      path = item$id,
      ui = makePage(
        name = item$name,
        ui = example$ui(item$id),
        code = example$code
      ),
      server = function() example$server(item$id)
    )
  })
  do.call(shiny.router::make_router, routes)
}

router <- makeRouter(items)

style <- tags$head(tags$style(HTML("
  .grid {
    display: grid;
    grid-template-columns: 200px minmax(0, 1fr);
    gap: 1em;
  }
")))

shinyApp(
  ui = tagList(
    style,
    tags$div(
      class = "grid",
      tags$nav(makeNav(sections)),
      tags$main(router$ui)
    )
  ),
  server = function(input, output) {
    router$server()
  }
)
