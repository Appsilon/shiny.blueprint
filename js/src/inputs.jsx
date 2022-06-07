import * as Blueprint from '@blueprintjs/core';
import { ButtonAdapter, InputAdapter }  from '@/shiny.react';

export const Button = ButtonAdapter(Blueprint.Button);

export const EditableText = InputAdapter(Blueprint.EditableText, (value, setValue) => ({
  value,
  onChange: setValue,
}));

export const Switch = InputAdapter(Blueprint.Switch, (value, setValue) => ({
  checked: value,
  onChange: (event) => setValue(event.target.checked),
}));
