customComponent <- function(name) {
  function(...) {
    shiny.react::reactElement(
      module = "@/appsilon.blueprint",
      name = name,
      props = shiny.react::asProps(...),
      deps = blueprintDependency()
    )
  }
}
