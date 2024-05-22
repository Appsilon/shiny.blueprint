# Shiny inputs tests

## Render and get value

- [ ] Button
- [ ] AnchorButton
- [ ] EditableText
- [x] ResizeSensor
- [ ] Tree
- [ ] Checkbox
- [ ] RadioGroup
- [ ] HTMLSelect
- [ ] Slider
- [ ] RangeSlider
- [ ] MultiSlider
- [ ] Switch
- [ ] NumericInput
- [ ] InputGroup
- [ ] TagInput
- [ ] TextArea
- [ ] Select
- [ ] Suggest
- [ ] MultiSelect

## Server-side update

- [ ] Button: update with `shiny.react::updateReactInput` appends new label to the old one
- [ ] AnchorButton: update with `shiny.react::updateReactInput` appends new label to the old one
- [x] EditableText
- [ ] ResizeSensor: requires custom update function or refactoring to use `InputAdapter`
- [ ] Tree: requires custom update function or refactoring to use `InputAdapter`
- [x] Checkbox
- [x] RadioGroup
- [x] HTMLSelect
- [x] Slider
- [x] RangeSlider
- [ ] MultiSlider: requires custom update function or refactoring to use `InputAdapter`
- [x] Switch
- [x] NumericInput
- [x] InputGroup
- [ ] TagInput: update with `shiny.react::updateReactInput` doesn't work out-of-the-box
- [x] TextArea
- [ ] Select: requires custom update function or refactoring to use `InputAdapter`
- [ ] Suggest: requires custom update function or refactoring to use `InputAdapter`
- [ ] MultiSelect: requires custom update function or refactoring to use `InputAdapter`
