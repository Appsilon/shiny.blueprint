const Blueprint = require('@blueprintjs/core');
const { InputAdapter } = require('@/shiny.react')

require('@blueprintjs/core/lib/css/blueprint.css');

const Switch = InputAdapter(Blueprint.Switch, (value, setValue) => ({
  checked: value,
  onChange: (event) => setValue(event.target.checked),
}));

window.jsmodule = {
  ...window.jsmodule,
  '@blueprintjs/core': require('@blueprintjs/core'),
  '@/blueprint': { Switch }
};
