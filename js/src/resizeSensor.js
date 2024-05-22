import React, { useCallback } from "react";
import PropTypes from "prop-types";
import { ResizeSensor as BlueprintResizeSensor } from "@blueprintjs/core";

const propTypes = {
  inputId: PropTypes.string,
  content: PropTypes.node,
  propsRest: PropTypes.object,
};

const ResizeSensor = ({ inputId, content, ...propsRest }) => {
  content.props = {
    ...content.props,
    style: {
      ...(content.props.style || {}),
      overflow: "auto",
      resize: "both",
    },
  }
  const handleResize = useCallback(([{ contentRect }]) => {
    Shiny.setInputValue(inputId, contentRect);
  });

  return React.createElement(
    BlueprintResizeSensor,
    {
      onResize: handleResize,
      ...propsRest,
    },
    content
  );
};

ResizeSensor.propTypes = propTypes;
export default ResizeSensor;
