blueprintDependency <- function() {
  htmltools::htmlDependency(
    name = "blueprint",
    version = "0.1.0",
    package = "appsilon.blueprint",
    src = "www",
    script = "blueprint.min.js"
  )
}

#' @param inputId The `input` slot that will be used to access the value.
#' @param ... Component props and children. See the official Blueprint docs for details.
#' @param value Initial value.
#' @name template
NULL

component <- function(name) {
  function(...) shiny.react::reactElement(
    module = "@blueprintjs/core",
    name = name,
    props = shiny.react::asProps(...),
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

input <- function(name, defaultValue) {
  function(inputId, ..., value = defaultValue) shiny.react::reactElement(
    module = "@/appsilon.blueprint",
    name = name,
    props = shiny.react::asProps(inputId = inputId, ..., value = value),
    deps = blueprintDependency()
  )
}

# TODO(porting): Breadcrumbs

#' Button
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/button>
#'
#' @example inst/examples/components/Button.R
#' @inherit template params
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
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/button-group>
#'
#' @example inst/examples/components/ButtonGroup.R
#' @inherit template params
#' @export
ButtonGroup <- component("ButtonGroup")

#' Callout
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/callout>
#'
#' @example inst/examples/components/Callout.R
#' @inherit template params
#' @export
Callout <- component("Callout")

#' Card
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/card>
#'
#' @example inst/examples/components/Card.R
#' @inherit template params
#' @export
Card <- component("Card")

#' Collapse
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/collapse>
#'
#' @example inst/examples/components/Collapse.R
#' @inherit template params
#' @export
Collapse <- component("Collapse")

# TODO(porting): Collapsible list

#' Divider
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/divider>
#'
#' @example inst/examples/components/Divider.R
#' @inherit template params
#' @export
Divider <- component("Divider")

#' Editable text
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/editable-text>
#'
#' @example inst/examples/components/EditableText.R
#' @inherit template params
#' @export
EditableText <- component("EditableText")

#' @rdname EditableText
#' @export
EditableText.shinyInput <- input("EditableText", "")

#' HTML elements
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/html>
#'
#' @example inst/examples/components/html_elements.R
#' @inherit template params
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
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/icon>
#'
#' @example inst/examples/components/Icon.R
#' @inherit template params
#' @export
Icon <- component("Icon")

#' Menu
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/menu>
#'
#' @example inst/examples/components/Menu.R
#' @inherit template params
#' @export
Menu <- component("Menu")

#' @rdname Menu
#' @export
MenuItem <- component("MenuItem")

#' @rdname Menu
#' @export
MenuDivider <- component("MenuDivider")

#' Navbar
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/navbar>
#'
#' @example inst/examples/components/Navbar.R
#' @inherit template params
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
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/non-ideal-state>
#'
#' @example inst/examples/components/NonIdealState.R
#' @inherit template params
#' @export
NonIdealState <- component("NonIdealState")

# TODO(porting): Overflow list

# TODO(porting): Panel stack (v2)

#' Progress bar
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/progress-bar>
#'
#' @example inst/examples/components/ProgressBar.R
#' @inherit template params
#' @export
ProgressBar <- component("ProgressBar")

# TODO(porting): Resize sensor

# TODO(porting): Skeleton

#' Spinner
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/spinner>
#'
#' @example inst/examples/components/Spinner.R
#' @inherit template params
#' @export
Spinner <- component("Spinner")

#' Tabs
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/tabs>
#'
#' @example inst/examples/components/Tabs.R
#' @inherit template params
#' @export
Tabs <- component("Tabs")

#' @rdname Tabs
#' @export
Tab <- component("Tab")

#' @rdname Tabs
#' @export
TabsExpander <- component("Expander")

#' Tag
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/tag>
#'
#' @example inst/examples/components/Tag.R
#' @inherit template params
#' @export
Tag <- component("Tag")

#' Text
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/text>
#'
#' @example inst/examples/components/Text.R
#' @inherit template params
#' @export
Text <- component("Text")

#' Tree
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/tree>
#'
#' @example inst/examples/components/Tree.R
#' @inherit template params
#' @export
Tree <- component("Tree")



# TODO(porting): Form group

# TODO(porting): Control group

# TODO(porting): Label

# TODO(porting): Checkbox

# TODO(porting): Radio

# TODO(porting): HTML select

# TODO(porting): Slider

#' Switch
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/switch>
#'
#' @example inst/examples/components/Switch.R
#' @inherit template params
#' @export
Switch <- component("Switch")

#' @rdname Switch
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

#' Popover
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/popover>
#'
#' @example inst/examples/components/Popover.R
#' @inherit template params
#' @export
Popover <- component("Popover")

# TODO(porting): Toast

# TODO(porting): Tooltip

# TODO(porting): HotkeysProvider
