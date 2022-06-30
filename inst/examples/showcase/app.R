library(appsilon.blueprint)
library(shiny.router)
library(shiny)

section <- function(name, ...) list(name = name, items = list(...))
item <- function(name, id) list(type = "item", name = name, id = id)

sections <- list(
  section(
    "COMPONENTS",
    item("Breadcrumbs", "Breadcrumbs"),
    item("Button", "Button"),
    item("Button group", "ButtonGroup"),
    item("Callout", "Callout"),
    item("Card", "Card"),
    item("Collapse", "Collapse"),
    item("Divider", "Divider"),
    item("Editable text", "EditableText"),
    item("HTML elements", "htmlElements"),
    item("HTML table", "HTMLTable"),
    # TODO: HotkeysTarget2
    item("Icon", "Icon"),
    item("Menu", "Menu"),
    item("Navbar", "Navbar"),
    item("Non-ideal state", "NonIdealState"),
    item("Overflow list", "OverflowList"),
    item("Panel stack (v2)", "PanelStack2"),
    item("Progress bar", "ProgressBar"),
    item("Resize sensor", "ResizeSensor"),
    item("Spinner", "Spinner"),
    item("Tabs", "Tabs"),
    item("Tag", "Tag"),
    item("Text", "Text"),
    item("Tree", "Tree")
  ),
  section(
    "FORM CONTROLS",
    item("Form group", "FormGroup"),
    item("Control group", "ControlGroup"),
    item("Label", "Label"),
    item("Checkbox", "Checkbox"),
    item("Radio", "Radio"),
    item("HTML select", "HTMLSelect"),
    item("Slider", "Slider"),
    item("Range slider", "RangeSlider"),
    item("Multi slider", "MultiSlider"),
    item("Switch", "Switch")
  ),
  section(
    "FORM INPUTS",
    item("File input", "FileInput"),
    item("Numeric input", "NumericInput"),
    item("Input group", "InputGroup"),
    item("Text area", "TextArea"),
    item("Tag input", "TagInput")
  ),
  section(
    "OVERLAYS",
    # TODO: Overlay
    # TODO: Portal
    # TODO: Alert
    # TODO: Context menu
    # TODO: Dialog
    # TODO: MultistepDialog
    # TODO: Drawer
    item("Popover", "Popover")
    # TODO: Toast
    # TODO: Tooltip
  ),
  section(
    "CONTEXT"
    # TODO: HotkeysProvider
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
    br(),
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
