navbarLeft <-
  NavbarGroup(
    align = "left",
    NavbarHeading(
      img(
        src = "appsilon-logo.png",
        style = "height: 32px;",
        alt = "Appsilon"
      )
    ),
    NavbarHeading(strong("Mbaza")),
    NavbarDivider(),
    span("Mbaza AI")
  )

navbarRight <-
  NavbarGroup(
    align = "right",
    Button(
      minimal = TRUE,
      icon = "projects",
      text = "Projects",
      style = list(color = "#fff")
    ),
    NavbarDivider(),
    Button(minimal = TRUE, icon = "user"),
    Button(minimal = TRUE, icon = "notifications"),
    Popover(
      Button(minimal = TRUE, icon = "globe"),
      Menu(
        MenuItem(text = "English"),
        MenuItem(text = "Français")
      )
    )
  )

navbar <- Navbar(
  className = "bp5-dark",
  navbarLeft,
  navbarRight
)
