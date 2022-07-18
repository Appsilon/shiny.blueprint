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

properties <- function(name) {
  function(...) {
    shiny.react::reactElement(
      module = "@/appsilon.blueprint",
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
#' @example inst/examples/Breadcrumbs.R
#' @inherit template params
#' @export
Breadcrumbs <- component("Breadcrumbs")

#' Button
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/button>
#'
#' @example inst/examples/Button.R
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
#' @example inst/examples/ButtonGroup.R
#' @inherit template params
#' @export
ButtonGroup <- component("ButtonGroup")

#' Callout
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/callout>
#'
#' @example inst/examples/Callout.R
#' @inherit template params
#' @export
Callout <- component("Callout")

#' Card
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/card>
#'
#' @example inst/examples/Card.R
#' @inherit template params
#' @export
Card <- component("Card")

#' Collapse
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/collapse>
#'
#' @example inst/examples/Collapse.R
#' @inherit template params
#' @export
Collapse <- component("Collapse")

#' Divider
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/divider>
#'
#' @example inst/examples/Divider.R
#' @inherit template params
#' @export
Divider <- component("Divider")

#' Editable text
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/editable-text>
#'
#' @example inst/examples/EditableText.R
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
#' @example inst/examples/htmlElements.R
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
#' @example inst/examples/HTMLTable.R
#' @inherit template params
#' @export
HTMLTable <- component("HTMLTable")

# TODO: HotkeysTarget2

#' Icon
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/icon>
#'
#' @example inst/examples/Icon.R
#' @inherit template params
#' @export
Icon <- component("Icon")

#' Menu
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/menu>
#'
#' @example inst/examples/Menu.R
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
#' @example inst/examples/Navbar.R
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
#' @example inst/examples/NonIdealState.R
#' @inherit template params
#' @export
NonIdealState <- component("NonIdealState")

#' Overflow list
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/overflow-list>
#'
#' @example inst/examples/OverflowList.R
#' @inherit template params
#' @export
OverflowList <- component("OverflowList")

#' Panel stack (v2)
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/panel-stack2>
#'
#' @example inst/examples/PanelStack2.R
#' @inherit template params
#' @export
PanelStack2 <- component("PanelStack2")

#' Progress bar
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/progress-bar>
#'
#' @example inst/examples/ProgressBar.R
#' @inherit template params
#' @export
ProgressBar <- component("ProgressBar")

#' Resize sensor
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/resize-sensor>
#'
#' @example inst/examples/ResizeSensor.R
#' @inherit template params
#' @export
ResizeSensor <- component("ResizeSensor")

#' Spinner
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/spinner>
#'
#' @example inst/examples/Spinner.R
#' @inherit template params
#' @export
Spinner <- component("Spinner")

#' Tabs
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/tabs>
#'
#' @example inst/examples/Tabs.R
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
#' @example inst/examples/Tag.R
#' @inherit template params
#' @export
Tag <- component("Tag")

#' Text
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/text>
#'
#' @example inst/examples/Text.R
#' @inherit template params
#' @export
Text <- component("Text")

#' Tree
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/tree>
#'
#' @example inst/examples/Tree.R
#' @inherit template params
#' @export
Tree <- component("Tree")

#' Form group
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/form-group>
#'
#' @example inst/examples/FormGroup.R
#' @inherit template params
#' @export
FormGroup <- component("FormGroup")

#' Control group
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/control-group>
#'
#' @example inst/examples/ControlGroup.R
#' @inherit template params
#' @export
ControlGroup <- component("ControlGroup")

#' Label
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/label>
#'
#' @family HTML elements
#' @example inst/examples/Label.R
#' @inherit template params
#' @export
Label <- component("Label")

#' Checkbox
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/checkbox>
#'
#' @example inst/examples/Checkbox.R
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
#' @example inst/examples/Radio.R
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
#' @example inst/examples/HTMLSelect.R
#' @inherit template params
#' @export
HTMLSelect <- component("HTMLSelect")

#' @rdname HTMLSelect
#' @export
HTMLSelect.shinyInput <- input("HTMLSelect", "") # nolint

#' Slider
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/sliders.slider>
#'
#' @example inst/examples/Slider.R
#' @inherit template params
#' @export
Slider <- component("Slider")

#' @rdname Slider
#' @export
Slider.shinyInput <- input("Slider", 0) # nolint

#' Range slider
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/sliders.range-slider>
#'
#' @example inst/examples/Slider.R
#' @inherit template params
#' @export
RangeSlider <- component("RangeSlider")

#' @rdname RangeSlider
#' @export
RangeSlider.shinyInput <- input("RangeSlider", c(0, 0)) # nolint

#' Multi slider
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/sliders.multi-slider>
#'
#' @example inst/examples/MultiSlider.R
#' @inherit template params
#' @export
MultiSlider <- component("MultiSlider")

#' @rdname MultiSlider
#' @export
MultiSliderHandle <- properties("MultiSliderHandle")

#' Switch
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/switch>
#'
#' @example inst/examples/Switch.R
#' @inherit template params
#' @export
Switch <- component("Switch")

#' @rdname Switch
#' @export
Switch.shinyInput <- input("Switch", FALSE) # nolint

#' FileInput
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/file-input>
#'
#' @example inst/examples/Switch.R
#' @inherit template params
#' @export
FileInput <- component("FileInput")

#' @rdname Switch
#' @export
FileInput.shinyInput <- input("FileInput", "") # nolint

#' NumericInput
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/numeric-input>
#'
#' @example inst/examples/NumericInput.R
#' @inherit template params
#' @export
NumericInput <- component("NumericInput")

#' @rdname NumericInput
#' @export
NumericInput.shinyInput <- input("NumericInput", 0) # nolint

#' Input group
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/text-inputs.input-group>
#'
#' @example inst/examples/InputGroup.R
#' @inherit template params
#' @export
InputGroup <- component("InputGroup")

#' @rdname InputGroup
#' @export
InputGroup.shinyInput <- input("InputGroup", "") # nolint

#' TagInput
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/tag-input>
#'
#' @example inst/examples/TagInput.R
#' @inherit template params
#' @export
TagInput <- component("TagInput")

#' @rdname TagInput
#' @export
TagInput.shinyInput <- input("TagInput", NULL) # nolint

#' Text area
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/text-inputs.text-area>
#'
#' @example inst/examples/TextArea.R
#' @inherit template params
#' @export
TextArea <- component("TextArea")

#' @rdname InputGroup
#' @export
TextArea.shinyInput <- input("TextArea", "") # nolint

#' Overlay
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/overlay>
#'
#' @example inst/examples/Overlay.R
#' @inherit template params
#' @export
Overlay <- component("Overlay")

# TODO: Portal

#' Alert
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/alert>
#'
#' @example inst/examples/Alert.R
#' @inherit template params
#' @export
Alert <- component("Alert")

# TODO: Context menu

#' Dialog
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/dialog.dialog>
#'
#' @example inst/examples/Dialog.R
#' @inherit template params
#' @export
Dialog <- component("Dialog")

#' Multistep dialog
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/dialog.multistep-dialog>
#'
#' @example inst/examples/MultistepDialog.R
#' @inherit template params
#' @export
MultistepDialog <- component("MultistepDialog")

#' @rdname MultistepDialog
#' @export
DialogStep <- component("DialogStep")

#' Drawer
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/drawer>
#'
#' @example inst/examples/Drawer.R
#' @inherit template params
#' @export
Drawer <- component("Drawer")

#' Popover
#'
#' Documentation: <https://blueprintjs.com/docs/#core/components/popover>
#'
#' @example inst/examples/Popover.R
#' @inherit template params
#' @export
Popover <- component("Popover")

# TODO: Tooltip

# TODO: HotkeysProvider
