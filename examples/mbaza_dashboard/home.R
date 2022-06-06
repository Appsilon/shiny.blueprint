menusExample <- div(
  Menu(
    className = "bp4-elevation-1 menu-example",
    MenuItem(icon = "new-text-box", text = "New, text box"),
    MenuItem(icon = "new-object", text = "New object"),
    MenuItem(icon = "new-link", text = "New link"),
    MenuDivider(),
    MenuItem(icon = "cog", text = "Settings...")
  ),
  Menu(
    className = "bp4-elevation-1 menu-example",
    MenuDivider(title = "Edit"),
    MenuItem(icon = "cut", text = "Cut", label = "⌘X"),
    MenuItem(icon = "duplicate", text = "Copy", label = "⌘C"),
    MenuItem(
      icon = "clipboard",
      text = "Paste",
      label = "⌘V",
      disabled = TRUE
    ),
    MenuDivider(title = "Text"),
    MenuItem(
      disabled = TRUE,
      icon = "align-left",
      text = "Alignment",
      MenuItem(icon = "align-left", text = "Left"),
      MenuItem(icon = "align-center", text = "Center"),
      MenuItem(icon = "align-right", text = "Right"),
      MenuItem(icon = "align-justify", text = "Justify")
    ),
    MenuItem(
      icon = "style",
      text = "Style",
      MenuItem(icon = "bold", text = "Bold"),
      MenuItem(icon = "italic", text = "Italic"),
      MenuItem(icon = "underline", text = "Underline")
    ),
    MenuItem(
      icon = "asterisk",
      text = "Miscellaneous",
      MenuItem(icon = "badge", text = "Badge"),
      MenuItem(icon = "book", text = "Long items will truncate when they reach max-width"),
      MenuItem(
        icon = "more",
        text = "Look in here for even more items",
        MenuItem(icon = "briefcase", text = "Briefcase"),
        MenuItem(icon = "calculator", text = "Calculator"),
        MenuItem(icon = "dollar", text = "Dollar"),
        MenuItem(
          icon = "dot",
          text = "Shapes",
          MenuItem(icon = "full-circle", text = "Full circle"),
          MenuItem(icon = "heart", text = "Heart"),
          MenuItem(icon = "ring", text = "Ring"),
          MenuItem(icon = "square", text = "Square")
        )
      )
    )
  )
)


homePage <- div(
  style = "flex: 1",
  div(
    style = "display: flex",
    div(
      style = "flex: 1; padding: 20px",
      Card(
        interactive = TRUE,
        elevation = 2,
        className = "bp4-running-text",
        h1(style = "margin-top: 0", "Welcome!"),
        "Seriously, we're glad to see you here!"
      )
    ),
    div(
      style = "flex: 1; padding: 20px",
      Callout(
        title = "Warning!",
        intent = "primary",
        "This is an early version of this package."
      )
    )
  ),
  div(style = "padding: 20px",
      Card(
        interactive = TRUE,
        elevation = 2,
        h1(style = "margin-top: 0", "Take a look at this awesome Blueprint example!"),
        menusExample
      )),
  div(
    style = "display: flex; justify-content: space-evenly; margin-top: 30px",
    img(style = "height: 60px; margin: 20px",
        src = "appsilon-logo.png",
        alt = "Appsilon")
  )
)
