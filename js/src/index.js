import "@blueprintjs/core/lib/css/blueprint.css";
import "@blueprintjs/popover2/lib/css/blueprint-popover2.css";
import "@blueprintjs/select/lib/css/blueprint-select.css";

import * as Blueprint from "@blueprintjs/core";
import * as BlueprintSelect from "@blueprintjs/select";
import * as Lodash from "lodash";

import * as Inputs from "./inputs.jsx";
import * as Suggests from "./suggest.js";
import * as Selects from "./select.js";
import * as MultiSelects from "./multiselect.js";
import * as DynamicComponents from "./dynamic-components.js";

import { appStateStore } from "./state-store.js";
import * as Mobx from "mobx";

import "./toaster.js";

window.jsmodule = {
  ...window.jsmodule,
  "@blueprintjs/core": Blueprint,
  "@blueprintjs/select": BlueprintSelect,
  "@lodash": Lodash,
  "@/shiny.blueprint": {
    ...Inputs,
    ...Suggests,
    ...Selects,
    ...MultiSelects,
    ...DynamicComponents,
  },
  appStateStore,
  Mobx,
};
