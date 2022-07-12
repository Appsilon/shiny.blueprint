import '@blueprintjs/core/lib/css/blueprint.css';
import '@blueprintjs/popover2/lib/css/blueprint-popover2.css';
import '@blueprintjs/select/lib/css/blueprint-select.css';

import * as BlueprintSelect from '@blueprintjs/select';
import * as Blueprint from '@blueprintjs/core';

import * as Inputs from './inputs.jsx';
import './toaster.js';

window.jsmodule = {
  ...window.jsmodule,
  '@blueprintjs/core': Blueprint,
  '@blueprintjs/select': BlueprintSelect,
  '@/appsilon.blueprint': Inputs,
};
