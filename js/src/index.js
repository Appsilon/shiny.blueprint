import '@blueprintjs/core/lib/css/blueprint.css';
import * as Blueprint from '@blueprintjs/core';
import * as Inputs from './inputs.jsx';
import './use-toaster.js';

window.jsmodule = {
  ...window.jsmodule,
  '@blueprintjs/core': Blueprint,
  '@/appsilon.blueprint': Inputs,
};
