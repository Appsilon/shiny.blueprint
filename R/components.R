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
  function(...) {
    shiny.react::reactElement(
      module = "@blueprintjs/core",
      name = name,
      props = shiny.react::asProps(...),
      deps = blueprintDependency()
    )
  }
}

button <- function(name) {
  function(inputId, ...) {
    shiny.react::reactElement(
      module = "@/appsilon.blueprint",
      name = name,
      props = shiny.react::asProps(inputId = inputId, ...),
      deps = blueprintDependency()
    )
  }
}

input <- function(name, defaultValue) {
  function(inputId, ..., value = defaultValue) {
    shiny.react::reactElement(
      module = "@/appsilon.blueprint",
      name = name,
      props = shiny.react::asProps(inputId = inputId, ..., value = value),
      deps = blueprintDependency()
    )
  }
}

#' Breadcrumbs
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/breadcrumbs>
#'
#' @example inst/examples/components/Breadcrumbs.R
#' @inherit template params
#' @export
Breadcrumbs <- component("Breadcrumbs")

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
Button.shinyInput <- button("Button") # nolint

#' @rdname Button
#' @export
AnchorButton <- component("AnchorButton")

#' @rdname Button
#' @export
AnchorButton.shinyInput <- button("AnchorButton") # nolint

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
EditableText.shinyInput <- input("EditableText", "") # nolint

#' HTML elements
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/html>
#'
#' @family HTML elements
#' @example inst/examples/components/htmlElements.R
#' @inherit template params
#' @name htmlElements
NULL

#' @rdname htmlElements
#' @export
H1 <- component("H1")

#' @rdname htmlElements
#' @export
H2 <- component("H2")

#' @rdname htmlElements
#' @export
H3 <- component("H3")

#' @rdname htmlElements
#' @export
H4 <- component("H4")

#' @rdname htmlElements
#' @export
H5 <- component("H5")

#' @rdname htmlElements
#' @export
H6 <- component("H6")

#' @rdname htmlElements
#' @export
Blockquote <- component("Blockquote")

#' @rdname htmlElements
#' @export
Code <- component("Code")

# Label has its own documentation page.

#' @rdname htmlElements
#' @export
Pre <- component("Pre")

#' @rdname htmlElements
#' @export
OL <- component("OL")

#' @rdname htmlElements
#' @export
UL <- component("UL")

#' HTML table
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/html-table>
#'
#' @family HTML elements
#' @example inst/examples/components/HTMLTable.R
#' @inherit template params
#' @export
HTMLTable <- component("HTMLTable")

# TODO: HotkeysTarget2

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

#' Overflow list
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/overflow-list>
#'
#' @example inst/examples/components/OverflowList.R
#' @inherit template params
#' @export
OverflowList <- component("OverflowList")

#' Panel stack (v2)
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/panel-stack2>
#'
#' @example inst/examples/components/PanelStack2.R
#' @inherit template params
#' @export
PanelStack2 <- component("PanelStack2")

#' Progress bar
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/progress-bar>
#'
#' @example inst/examples/components/ProgressBar.R
#' @inherit template params
#' @export
ProgressBar <- component("ProgressBar")

#' Resize sensor
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/resize-sensor>
#'
#' @example inst/examples/components/ResizeSensor.R
#' @inherit template params
#' @export
ResizeSensor <- component("ResizeSensor")

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

#' Form group
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/form-group>
#'
#' @example inst/examples/components/FormGroup.R
#' @inherit template params
#' @export
FormGroup <- component("FormGroup")

#' Control group
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/control-group>
#'
#' @example inst/examples/components/ControlGroup.R
#' @inherit template params
#' @export
ControlGroup <- component("ControlGroup")

#' Label
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/label>
#'
#' @family HTML elements
#' @example inst/examples/components/Label.R
#' @inherit template params
#' @export
Label <- component("Label")

#' Checkbox
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/checkbox>
#'
#' @example inst/examples/components/Checkbox.R
#' @inherit template params
#' @export
Checkbox <- component("Checkbox")

#' @rdname Checkbox
#' @export
Checkbox.shinyInput <- input("Checkbox", FALSE) # nolint

#' Radio
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/radio>
#'
#' @example inst/examples/components/Radio.R
#' @inherit template params
#' @export
Radio <- component("Radio")

#' @rdname Radio
#' @export
RadioGroup <- component("RadioGroup")

#' @rdname Radio
#' @export
RadioGroup.shinyInput <- input("RadioGroup", NULL) # nolint

#' HTML select
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/html-select>
#'
#' @example inst/examples/components/HTMLSelect.R
#' @inherit template params
#' @export
HTMLSelect <- component("HTMLSelect")

#' @rdname HTMLSelect
#' @export
HTMLSelect.shinyInput <- input("HTMLSelect", "") # nolint

# TODO: Slider

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
Switch.shinyInput <- input("Switch", FALSE) # nolint

# TODO: File input

# TODO: Numeric input

#' Input group
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/text-inputs.input-group>
#'
#' @example inst/examples/components/InputGroup.R
#' @inherit template params
#' @export
InputGroup <- component("InputGroup")

#' @rdname InputGroup
#' @export
InputGroup.shinyInput <- input("InputGroup", "") # nolint

# TODO: Tag input

#' Text area
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/text-inputs.text-area>
#'
#' @example inst/examples/components/TextArea.R
#' @inherit template params
#' @export
TextArea <- component("TextArea")

#' @rdname InputGroup
#' @export
TextArea.shinyInput <- input("TextArea", "") # nolint

# TODO: Overlay

# TODO: Portal

# TODO: Alert

# TODO: Context menu

# TODO: Dialog

# TODO: MultistepDialog

# TODO: Drawer

#' Popover
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/popover>
#'
#' @example inst/examples/components/Popover.R
#' @inherit template params
#' @export
Popover <- component("Popover")

# TODO: Toast

# TODO: Tooltip

# TODO: HotkeysProvider
