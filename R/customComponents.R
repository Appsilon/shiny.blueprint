customComponent <- function(name) {
  function(id = NULL, ...) {
    shiny.react::reactElement(
      module = "@/appsilon.blueprint",
      name = name,
      props = shiny.react::asProps(id = id, ...),
      deps = blueprintDependency()
    )
  }
}
