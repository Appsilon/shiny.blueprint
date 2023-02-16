blueprintDependency <- function() {
  htmltools::htmlDependency(
    name = "blueprint",
    version = "0.1.0",
    package = "shiny.blueprint",
    src = "www",
    script = "blueprint.min.js"
  )
}
