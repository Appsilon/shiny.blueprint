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
    item("Overlay", "Overlay"),
    item("Alert", "Alert"),
    # TODO: Context menu
    item("Dialog", "Dialog"),
    item("Multistep dialog", "MultistepDialog"),
    item("Drawer", "Drawer"),
    item("Popover", "Popover"),
    item("Toast", "Toast")
    # TODO: Tooltip
  ),
  section(
    "CONTEXT"
    # TODO: HotkeysProvider
  ),
  section(
    "SELECT",
    item("Suggest", "Suggest"),
    item("Select", "Select")
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
  rPath <- file.path("..", paste0(id, ".R"))
  rCode <- readChar(rPath, file.info(rPath)$size)

  jsPath <- file.path("../js-helpers", paste0(id, ".js"))
  jsCode <- if (file.exists(jsPath)) readChar(jsPath, file.info(jsPath)$size) else NULL

  module <- new.env()
  module$addResourcePath <- function(prefix, directoryPath) {}
  source(rPath, local = module)
  list(rCode = rCode, jsCode = jsCode, ui = module$ui, server = module$server)
}

makePage <- function(id, name, ui, rCode, jsCode) {
  jsSection <- if (!is.null(jsCode)) {
    div(
      H5("JavaScript"),
      Pre(tags$code(class = "language-javascript", jsCode))
    )
  } else {
    NULL
  }

  tagList(
    H1(name),
    H3("Example"),
    div(
      class = "example-section",
      # The ID is used to locate the example in Cypress tests.
      div(`data-example-id` = id, ui)
    ),
    H3("Code"),
    div(class = "code-section",
      div(
        H5("R"),
        Pre(tags$code(class = "language-r", rCode))
      ),
      jsSection
    )
  )
}

makeRouter <- function(items) {
  routes <- lapply(items, function(item) {
    example <- readExample(item$id)
    route(
      path = item$id,
      ui = makePage(
        id = item$id,
        name = item$name,
        ui = example$ui(item$id),
        rCode = example$rCode,
        jsCode = example$jsCode
      ),
      server = function() example$server(item$id)
    )
  })
  do.call(shiny.router::make_router, routes)
}

router <- makeRouter(items)

addResourcePath("static", "../js-helpers")
addResourcePath("showcase-static", "./static")

shinyApp(
  ui = tagList(
    tags$script(src = "showcase-static/js/prism.js"),
    tags$link(rel = "stylesheet", type = "text/css", href = "showcase-static/css/prism.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "showcase-static/css/styles.css"),
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
