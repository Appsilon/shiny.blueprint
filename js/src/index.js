import "@blueprintjs/core/lib/css/blueprint.css";
import "@blueprintjs/popover2/lib/css/blueprint-popover2.css";
import "@blueprintjs/select/lib/css/blueprint-select.css";

import * as BlueprintSelect from "@blueprintjs/select";
import * as Blueprint from "@blueprintjs/core";

import * as Inputs from './inputs';
import Suggest from './suggest';
import Select from './select';
import MultiSelect from './multiselect';
import MultiSlider from './multiSlider';
import Tree from './tree';
import ResizeSensor from "./resizeSensor.js";

import './toaster';

window.jsmodule = {
  ...window.jsmodule,
  "@blueprintjs/core": Blueprint,
  "@blueprintjs/select": BlueprintSelect,
  "@/shiny.blueprint": {
    ...Inputs,
    Suggest,
    Select,
    MultiSelect,
    MultiSlider,
    Tree,
    ResizeSensor,
  },
};
