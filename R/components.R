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
    module = "@/shiny.blueprint",
    name = name,
    props = shiny.react::asProps(inputId = inputId, ..., value = value),
    deps = blueprintDependency()
  )
}

button <- function(name) {
  function(inputId, ...) shiny.react::reactElement(
    module = "@/shiny.blueprint", 
    name = name,
    props = shiny.react::asProps(inputId = inputId, ...),
    deps = blueprintDependency()
  )
}

#' @export
ProgressBar <- component("ProgressBar")

#' @export
Callout <- component("Callout")

#' @export
Card <- component("Card")

#' @export
Pre <- component("Pre")

#' @export
H1 <- component("H1")

#' @export
H2 <- component("H2")

#' @export
H3 <- component("H3")

#' @export
H4 <- component("H4")

#' @export
H5 <- component("H5")

#' @export
H6 <- component("H6")

#' @export
Blockquote <- component("Blockquote")

#' @export
Code <- component("Code")

#' @export
Label <- component("Label")

#' @export
OL <- component("OL")

#' @export
UL <- component("UL")

#' @export
HTMLTable <- component("HTMLTable")

#' @export
Icon <- component("Icon")

#' @export
Divider <- component("Divider")

#' @export
Collapse <- component("Collapse")

#' @export
Switch <- component("Switch")

#' @export
Switch.shinyInput <- input("Switch", FALSE)

#' @export
Spinner <- component("Spinner")

#' @export
ButtonGroup <- component("ButtonGroup")

#' @export
Button <- component("Button")

#' @export
Button.shinyInput <- button("Button")

#' @export
EditableText.shinyInput <- input("EditableText", "")

#' @export
MenuDivider <- component("MenuDivider")

#' @export
Menu <- component("Menu")

#' @export
MenuItem <- component("MenuItem")

#' @export
Navbar <- component("Navbar")

#' @export
NavbarGroup <- component("NavbarGroup")

#' @export
NavbarHeading <- component("NavbarHeading")

#' @export
NavbarDivider <- component("NavbarDivider")
