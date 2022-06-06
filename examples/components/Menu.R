library(shiny)
library(shiny.react)
library(appsilon.blueprint)

shinyApp(
  ui = tagList(
    Menu(
      MenuItem(icon = "new-text-box", text = "New text box"),
      MenuItem(icon = "new-object", text = "New object"),
      MenuItem(icon = "new-link", text = "New link"),
      MenuDivider(),
      MenuItem(text = "Settings...", icon = "cog", intent = "primary",
        MenuItem(icon = "tick", text = "Save on edit"),
        MenuItem(icon = "blank", text = "Compile on edit")
      )
    ),
    Menu(className = 'bp4-elevation-1',
      MenuDivider(title = "Edit"),
      MenuItem(icon = "cut", text = "Cut", label = "⌘X"),
      MenuItem(icon = "duplicate", text = "Copy", label = "⌘C"),
      MenuItem(icon = "clipboard", text = "Paste", label = "⌘V", disabled = "true"),
      MenuDivider(title = "Text"),
      MenuItem(disabled = "true", icon = "align-left", text = "Alignment",
        MenuItem(icon = "align-left", text = "Left"),
        MenuItem(icon = "align-center", text = "Center"),
        MenuItem(icon = "align-right", text = "Right"),
        MenuItem(icon = "align-justify", text = "Justify")
      ),
      MenuItem(icon = "style", text = "Style",
        MenuItem(icon = "bold", text = "Bold"),
        MenuItem(icon = "italic", text = "Italic"),
        MenuItem(icon = "underline", text = "Underline")
      ),
      MenuItem(icon = "asterisk", text = "Miscellaneous",
        MenuItem(icon = "badge", text = "Badge"),
        MenuItem(icon = "book", text = "Long items will truncate when they reach max-width"),
        MenuItem(icon = "more", text = "Look in here for even more items",
          MenuItem(icon = "briefcase", text = "Briefcase"),
          MenuItem(icon = "calculator", text = "Calculator"),
          MenuItem(icon = "dollar", text = "Dollar"),
          MenuItem(icon = "dot", text = "Shapes",
            MenuItem(icon = "full-circle", text = "Full circle"),
            MenuItem(icon = "heart", text = "Heart"),
            MenuItem(icon = "ring", text = "Ring"),
            MenuItem(icon = "square", text = "Square")
          )
        )
      )
    )
  ),
  server = function(input, output) {
  }
)
