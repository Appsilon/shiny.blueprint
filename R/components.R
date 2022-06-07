blueprintDependency <- function() {
  htmltools::htmlDependency(
    name = "blueprint",
    version = "0.1.0",
    package = "appsilon.blueprint",
    src = "www",
    script = "blueprint.min.js"
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
    module = "@/appsilon.blueprint",
    name = name,
    props = shiny.react::asProps(inputId = inputId, ..., value = value),
    deps = blueprintDependency()
  )
}

button <- function(name) {
  function(inputId, ...) shiny.react::reactElement(
    module = "@/appsilon.blueprint",
    name = name,
    props = shiny.react::asProps(inputId = inputId, ...),
    deps = blueprintDependency()
  )
}

# TODO(porting): Breadcrumbs

#' Button
#' @example inst/examples/components/Button.R
#' @export
Button <- component("Button")

#' @rdname Button
#' @export
Button.shinyInput <- button("Button")

#' @rdname Button
#' @export
AnchorButton <- component("AnchorButton")

#' @rdname Button
#' @export
AnchorButton.shinyInput <- button("AnchorButton")

#' Button group
#' @example inst/examples/components/ButtonGroup.R
#' @export
ButtonGroup <- component("ButtonGroup")

#' Callout
#' @example inst/examples/components/Callout.R
#' @export
Callout <- component("Callout")

#' Card
#' @example inst/examples/components/Card.R
#' @export
Card <- component("Card")

#' Collapse
#' @example inst/examples/components/Collapse.R
#' @export
Collapse <- component("Collapse")

# TODO(porting): Collapsible list

#' Divider
#' @example inst/examples/components/Divider.R
#' @export
Divider <- component("Divider")

# TODO: Add EditableText plain component

#' @export
EditableText.shinyInput <- input("EditableText", "")

#' HTML elements
#' @example inst/examples/components/html_elements.R
#' @name html_elements
NULL

#' @rdname html_elements
#' @export
H1 <- component("H1")

#' @rdname html_elements
#' @export
H2 <- component("H2")

#' @rdname html_elements
#' @export
H3 <- component("H3")

#' @rdname html_elements
#' @export
H4 <- component("H4")

#' @rdname html_elements
#' @export
H5 <- component("H5")

#' @rdname html_elements
#' @export
H6 <- component("H6")

#' @rdname html_elements
#' @export
Blockquote <- component("Blockquote")

#' @rdname html_elements
#' @export
Code <- component("Code")

#' @rdname html_elements
#' @export
Label <- component("Label")

#' @rdname html_elements
#' @export
Pre <- component("Pre")

#' @rdname html_elements
#' @export
OL <- component("OL")

#' @rdname html_elements
#' @export
UL <- component("UL")

#' @rdname html_elements
#' @export
HTMLTable <- component("HTMLTable")

# TODO(porting): HotkeysTarget2

#' Icon
#' @example inst/examples/components/Icon.R
#' @export
Icon <- component("Icon")

#' Menu
#' @example inst/examples/components/Menu.R
#' @export
Menu <- component("Menu")

#' @rdname Menu
#' @export
MenuItem <- component("MenuItem")

#' @rdname Menu
#' @export
MenuDivider <- component("MenuDivider")

#' Navbar
#' @example inst/examples/components/Navbar.R
#' @export
Navbar <- component("Navbar")

#' @rdname Navbar
#' @export
NavbarGroup <- component("NavbarGroup")

#' @rdname Navbar
#' @export
NavbarHeading <- component("NavbarHeading")

#' @rdname Navbar
#' @export
NavbarDivider <- component("NavbarDivider")

#' Non-ideal state
#' @example inst/examples/components/NonIdealState.R
#' @export
NonIdealState <- component("NonIdealState")

# TODO(porting): Overflow list

# TODO(porting): Panel stack (v2)

#' @export
ProgressBar <- component("ProgressBar")

# TODO(porting): Resize sensor

# TODO(porting): Skeleton

#' @export
Spinner <- component("Spinner")

# TODO(porting): Tabs

# TODO(porting): Tag

# TODO(porting): Text

# TODO(porting): Tree

# TODO(porting): Form group

# TODO(porting): Control group

# TODO(porting): Label

# TODO(porting): Checkbox

# TODO(porting): Radio

# TODO(porting): HTML select

# TODO(porting): Slider

#' Switch
#' @example inst/examples/components/Switch.R
#' @export
Switch <- component("Switch")

#' @rdname Switch
#' @example inst/examples/components/Switch.shinyInput.R
#' @export
Switch.shinyInput <- input("Switch", FALSE)

# TODO(porting): File input

# TODO(porting): Numeric input

# TODO(porting): Text inputs

# TODO(porting): Tag input

# TODO(porting): Overlay

# TODO(porting): Portal

# TODO(porting): Alert

# TODO(porting): Context menu

# TODO(porting): Dialogs

# TODO(porting): Drawer

#' @export
Popover <- component("Popover")

# TODO(porting): Toast

# TODO(porting): Tooltip

# TODO(porting): HotkeysProvider
