library(shiny.blueprint)
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
  # TODO: HotkeysProvider - section
  section(
    "SELECT",
    item("Suggest", "Suggest"),
    item("Select", "Select"),
    item("MultiSelect", "MultiSelect")
  )
)
items <- do.call(c, lapply(sections, `[[`, "items"))

makeNav <- function(sections) {
  sections <- lapply(sections, function(section) {
    sectionId <- paste0(
      "section-",
      gsub(" ", "-", tolower(section$name))
    )
    tagList(
      tags$button(
        section$name,
        class = "section-button",
        onclick = paste0(
          "$('#", sectionId, "').slideToggle();",
          "$(this).toggleClass('expanded');"
        )
      ),
      UL(
        id = sectionId,
        style = "display: none;",
        lapply(section$items, function(item) {
          tags$li(
            tags$a(item$name, href = route_link(item$id)),
            class = "li-button"
          )
        })
      )
    )
  })
  tagList(
    tags$a(class = "home-button", "HOME", href = route_link("/")),
    sections
  )
}

addFileName <- function(code, filename, commentChar) {
  paste0(commentChar, " ", filename, "\n\n", code)
}

readExample <- function(id) {
  rPath <- system.file(file.path("examples", paste0(id, ".R")), package = "shiny.blueprint")
  if (!file.exists(rPath)) {
    return()
  }
  rCode <- addFileName(readChar(rPath, file.info(rPath)$size), basename(rPath), "#")

  module <- new.env()
  source(rPath, local = module)
  list(rCode = rCode, ui = module$ui, server = module$server)
}

makePage <- function(id, name, ui, rCode) {
  tagList(
    H2(name, class = "component-name"),
    H5("Example"),
    div(
      class = "example-section",
      # The ID is used to locate the example in Cypress tests.
      div(`data-example-id` = id, ui)
    ),
    div(
      H5("R code"),
      Pre(tags$code(class = "language-r", rCode))
    )
  )
}

makeRouter <- function(items) {
  routes <- lapply(items, function(item) {
    example <- readExample(item$id)
    if (is.null(example)) {
      return()
    }
    route(
      path = item$id,
      ui = makePage(
        id = item$id,
        name = item$name,
        ui = example$ui(item$id),
        rCode = example$rCode
      ),
      server = function() example$server(item$id)
    )
  })
  routes <- append(
    list(route(
      path = "/",
      ui = div(
        class = "home-page",
        H2(
          class = "home-page-title",
          "This is a ",
          tags$a(
            "Blueprint",
            class = "weight-300",
            href = "https://blueprintjs.com/",
            target = "_blank"
          ),
          " app built in Shiny"
        ),
        span(class = "font-mono", "shiny.react + Blueprint = shiny.blueprint"),
        Card(
          class = "home-page-section",
          span("Welcome to ", tags$strong(class = "font-mono", "shiny.blueprint"), " demo!"),
          span(
            tags$strong(class = "font-mono", "shiny.blueprint"), " is a package that allows ",
            "you to build Shiny apps using Blueprint - a React-based UI toolkit for the web."
          ),
          span("Use the menu on the left to explore live demos of all available components.")
        ),
        Card(
          class = "home-page-section direction-row",
          div(
            H4(class = "font-mono weight-600", "shiny.react"),
            span(
              "R package enables using React in Shiny apps. It contains R and JS code which ",
              "is independent from the React library that is being wrapped."
            )
          ),
          a(
            href = "https://appsilon.github.io/shiny.react/",
            target = "_blank",
            img(
                class = "logo",
                src = "https://github.com/Appsilon/shiny.react/raw/master/man/figures/shiny-react.png" # nolint
            )
          )
        ),
        Card(
          class = "home-page-section direction-row",
          div(
            H4(class = "font-mono weight-600", "Blueprint"),
            span(
              "A React-based UI toolkit for the web. It is optimized for building complex, ",
              "data-dense web interfaces for desktop applications which run in modern ",
              "browsers and IE11. This is not a mobile-first UI toolkit."
            )
          ),
          a(
            href = "https://blueprintjs.com/",
            target = "_blank",
            img(
              class = "logo",
              src = "https://cloud.githubusercontent.com/assets/464822/20228152/d3f36dc2-a804-11e6-80ff-51ada2d13ea7.png" # nolint
            )
          )
        )
      ),
      server = function(input, output, session) {}
    )),
    routes
  )
  do.call(make_router, routes)
}

router <- makeRouter(items)

addResourcePath("showcase-static", "./static")

shinyApp(
  ui = tagList(
    tags$script(
      src = "showcase-static/js/highlight.v11.7.0.min.js"
    ),
    tags$script(
      src = "showcase-static/js/highlight_all.js"
    ),
    tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "showcase-static/css/mono-blue.min.css"
    ),
    tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "showcase-static/css/styles.css"
    ),
    tags$div(
      class = "grid",
      tags$nav(class = "sidebar", makeNav(sections)),
      tags$main(router$ui)
    )
  ),
  server = function(input, output, session) {
    router$server()
    session$sendCustomMessage("highlight_all", list())
  }
)
