routes <- list(
  HOME = list(
    path = "/",
    iconName = "home",
    title = "Home"
  ),
  EXTRACT_FRAMES = list(
    path = "/extract-frames",
    iconName = "mobile-video",
    title = "Extract from video"
  ),
  CLASSIFY = list(
    path = "/classify",
    iconName = "send-to-graph",
    title = "Classify photos"
  ),
  EXPLORE = list(
    path = "/explore",
    iconName = "search-template",
    title = "Explore results"
  )
)
names(routes) <- NULL

sidebarItem <- function(item) {
  shiny::a(
    href = item$path,
    class = "sidebar_item",
    appsilon.blueprint::Button(
      minimal = TRUE,
      icon = item$iconName,
      text = item$title,
      style = list(
        color = "#fff",
        width = "100%",
        padding = "20px"
      ),
      alignText = "left",
      active = FALSE
    )
  )
}

sidebar <- div(
  class = "sidebar",
  style = "display: flex; flex-direction: column; text-align: center;",
  lift(div)(map(routes, sidebarItem))
)
