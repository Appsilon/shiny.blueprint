import React from "react";
import PropTypes from "prop-types";
import { MultiSlider as MultiSliderBlueprint } from "@blueprintjs/core";

const propTypes = {
  inputId: PropTypes.string,
  values: PropTypes.array,
};

const MultiSlider = ({ inputId, values, ...propsRest }) => {
  const [state, setState] = React.useState(values.map(({ value }) => value));

  React.useEffect(() => Shiny.setInputValue(inputId, state), []);

  const handleOnChange = React.useCallback((newState) => {
    Shiny.setInputValue(inputId, newState);
    setState(newState);
  }, []);

  return React.createElement(
    MultiSliderBlueprint,
    {
      onChange: handleOnChange,
      ...propsRest,
    },
    values.map(({ value: _, ...props }, i) =>
      React.createElement(MultiSliderBlueprint.Handle, {
        value: state[i],
        ...{
          ...props,
          key: i,
        }
      })
    )
  );
};

MultiSlider.propTypes = propTypes;
export default MultiSlider;
