navbarLeft <-
  NavbarGroup(
    align = 'left',
    NavbarHeading(
      img(src = "appsilon-logo.png",
          style = "height: 32px;",
          alt = "Appsilon")
    ),
    NavbarHeading(strong("Mbaza")),
    NavbarDivider(),
    span("Mbaza AI")
  )

navbarRight <-
  NavbarGroup(
    align = 'right',
    Button(
      minimal = "true",
      icon = "projects",
      text = "Projects",
      style = list(color = "#fff")
    ),
    NavbarDivider(),
    Button(minimal = "true", icon = "user"),
    Button(minimal = "true", icon = "notifications"
    ),
    Popover(
      Button(minimal = "true", icon = "globe"),
      Menu(MenuItem(text = "English"),
           MenuItem(text = "Français"))
    )
  )

navbar <- Navbar(className = "bp4-dark",
                 navbarLeft,
                 navbarRight)
