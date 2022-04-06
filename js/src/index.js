const Blueprint = require('@blueprintjs/core');
const { ButtonAdapter, InputAdapter } = require('@/shiny.react')

require('@blueprintjs/core/lib/css/blueprint.css');

const Button = ButtonAdapter(Blueprint.Button);

const Switch = InputAdapter(Blueprint.Switch, (value, setValue) => ({
  checked: value,
  onChange: (event) => setValue(event.target.checked),
}));

const EditableText = InputAdapter(Blueprint.EditableText, (value, setValue) => ({
  value,
  onChange: setValue
  }
));

window.jsmodule = {
  ...window.jsmodule,
  '@blueprintjs/core': require('@blueprintjs/core'),
  '@/appsilon.blueprint': { Switch, Button, EditableText }
};
