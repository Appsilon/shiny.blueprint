library(shiny.blueprint)
library(shiny)

ui <- function(id) {
  Menu(
    style = "max-width: 200px",
    className = "bp5-elevation-1",
    MenuDivider(title = "Edit"),
    MenuItem(icon = "cut", text = "Cut", label = "^X"),
    MenuItem(icon = "duplicate", text = "Copy", label = "^C"),
    MenuItem(icon = "clipboard", text = "Paste", label = "^V", disabled = TRUE),
    MenuDivider(title = "Text"),
    MenuItem(
      icon = "style", text = "Style",
      MenuItem(icon = "bold", text = "Bold"),
      MenuItem(icon = "italic", text = "Italic"),
      MenuItem(icon = "underline", text = "Underline")
    ),
    MenuItem(
      icon = "asterisk", text = "Miscellaneous",
      MenuItem(icon = "badge", text = "Badge"),
      MenuItem(icon = "book", text = "Long items will truncate when they reach max-width"),
      MenuItem(
        icon = "more", text = "Look in here for even more items",
        MenuItem(icon = "briefcase", text = "Briefcase"),
        MenuItem(icon = "calculator", text = "Calculator"),
        MenuItem(icon = "dollar", text = "Dollar"),
        MenuItem(
          icon = "dot", text = "Shapes",
          MenuItem(icon = "full-circle", text = "Full circle"),
          MenuItem(icon = "heart", text = "Heart"),
          MenuItem(icon = "ring", text = "Ring"),
          MenuItem(icon = "square", text = "Square")
        )
      )
    ),
    MenuDivider(),
    MenuItem(
      icon = "cog", labelElement = Icon(icon = "share"),
      text = "Settings...", intent = "primary"
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
