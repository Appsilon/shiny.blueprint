import * as Blueprint from '@blueprintjs/core';
import { ButtonAdapter, InputAdapter }  from '@/shiny.react';

export const Button = ButtonAdapter(Blueprint.Button);
export const AnchorButton = ButtonAdapter(Blueprint.AnchorButton);

export const EditableText = InputAdapter(Blueprint.EditableText, (value, setValue) => ({
  value,
  onChange: setValue,
}));

export const Checkbox = InputAdapter(Blueprint.Checkbox, (value, setValue) => ({
  checked: value,
  onChange: (event) => setValue(event.target.checked),
}));

export const RadioGroup = InputAdapter(Blueprint.RadioGroup, (value, setValue) => ({
  selectedValue: value,
  onChange: (event) => setValue(event.currentTarget.value),
}));

export const HTMLSelect = InputAdapter(Blueprint.HTMLSelect, (value, setValue) => ({
  value,
  onChange: (event) => setValue(event.target.value),
}));

export const Slider = InputAdapter(Blueprint.Slider, (value, setValue) => ({
  value,
  onChange: setValue,
}));

export const RangeSlider = InputAdapter(Blueprint.RangeSlider, (value, setValue) => ({
  value,
  onChange: setValue,
}));

export const Switch = InputAdapter(Blueprint.Switch, (value, setValue) => ({
  checked: value,
  onChange: (event) => setValue(event.target.checked),
}));

export const FileInput = InputAdapter(Blueprint.FileInput, (value, setValue) => ({
  text: value,
  onInputChange: (event) => setValue(event.target.value),
}));

export const NumericInput = InputAdapter(Blueprint.NumericInput, (value, setValue) => ({
  value,
  onValueChange: setValue,
}));

export const InputGroup = InputAdapter(Blueprint.InputGroup, (value, setValue) => ({
  value,
  onChange: (event) => setValue(event.target.value),
}));

export const TagInput = InputAdapter(Blueprint.TagInput, (values, setValue) => ({
  values,
  onChange: setValue,
}));

export const TextArea = InputAdapter(Blueprint.TextArea, (value, setValue) => ({
  value,
  onChange: (event) => setValue(event.target.value),
}));
