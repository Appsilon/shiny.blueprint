blueprintDependency <- function() {
  htmltools::htmlDependency(
    name = "blueprint",
    version = "0.1.0",
    package = "shiny.blueprint",
    src = "www",
    script = "blueprint.js"
  )
}

component <- function(name) {
  function(...) shiny.react::reactElement(
    module = "@blueprintjs/core",
    name = name,
    props = shiny.react::asProps(...),
    deps = blueprintDependency()
  )
}

input <- function(name, defaultValue) {
  function(inputId, ..., value = defaultValue) shiny.react::reactElement(
    module = "@/blueprint",
    name = name,
    props = shiny.react::asProps(inputId = inputId, ..., value = value),
    deps = blueprintDependency()
  )
}

#' @export
ProgressBar <- component("ProgressBar")

#' @export
Switch <- component("Switch")

#' @export
Spinner <- component("Spinner")

#' @export
Switch.shinyInput <- input("Switch", FALSE)
