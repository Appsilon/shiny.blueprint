blueprintDependency <- function() {
  htmltools::htmlDependency(
    name = "blueprint",
    version = "0.1.0",
    package = "react.blueprint",
    src = "www",
    script = "blueprint.min.js"
  )
}
