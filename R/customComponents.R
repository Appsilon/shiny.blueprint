customComponent <- function(name) {
  function(..., componentStateKey = NULL) {
    componentStateKey <- if (is.null(componentStateKey)) uuid::UUIDgenerate() else componentStateKey
    shiny.react::reactElement(
      module = "@/shiny.blueprint",
      name = name,
      props = shiny.react::asProps(componentStateKey = componentStateKey, ...),
      deps = blueprintDependency()
    )
  }
}

#' Custom component
#' @export
CustomComponent <- function(componentName, ..., componentStateKey = NULL) {
    componentStateKey <- if (is.null(componentStateKey)) uuid::UUIDgenerate() else componentStateKey
    shiny.react::reactElement(
      module = "@/shiny.blueprint",
      name = "DynamicCustomComponent",
      props = shiny.react::asProps(componentName = componentName, componentStateKey = componentStateKey, ...,)
    )
  }
