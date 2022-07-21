import "@blueprintjs/core/lib/css/blueprint.css";
import "@blueprintjs/popover2/lib/css/blueprint-popover2.css";
import "@blueprintjs/select/lib/css/blueprint-select.css";

import * as BlueprintSelect from "@blueprintjs/select";
import * as Blueprint from "@blueprintjs/core";

import * as Inputs from "./inputs.jsx";
import * as Suggests from "./suggest.js";
import * as Selects from "./select.js";
import * as MultiSelects from "./multiselect.js";
import * as DynamicComponents from "./dynamic-components.js";

import "./toaster.js";

window.jsmodule = {
  ...window.jsmodule,
  "@blueprintjs/core": Blueprint,
  "@blueprintjs/select": BlueprintSelect,
  "@/shiny.blueprint": {
    ...Inputs,
    ...Suggests,
    ...Selects,
    ...MultiSelects,
    ...DynamicComponents,
  },
};
