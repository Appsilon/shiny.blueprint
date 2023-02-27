import * as React from "react";
import PropTypes from "prop-types";
import { PanelStack2 } from "@blueprintjs/core";
import styles from "./PanelStack.module.css";

const PanelsType = PropTypes.arrayOf(
  PropTypes.shape({
    id: PropTypes.string,
    title: PropTypes.string,
    content: PropTypes.node,
  })
);

export const panelStackHandlers = {};

const Panel = ({ content }) => {
  return React.createElement("div", { style: { padding: 10 } }, content);
};
Panel.propTypes = {
  content: PropTypes.node,
};

const PanelStack = ({ panels, ns, size, ...propsRest }) => {
  const [stack, setStack] = React.useState([
    {
      renderPanel: Panel,
      title: panels[0].title,
      props: { content: panels[0].content },
    },
  ]);
  const addToPanelStack = (newPanel) =>
    setStack((stack) => [...stack, newPanel]);
  const removeFromPanelStack = () => setStack((stack) => stack.slice(0, -1));
  React.useEffect(() => {
    panelStackHandlers[ns] = {
      openPanel: (panelId) => {
        const { title, content } = panels.find(({ id }) => id == panelId);
        addToPanelStack({
          renderPanel: Panel,
          title,
          props: { content },
        });
      },
      closePanel: removeFromPanelStack,
    };
    return () => delete panelStackHandlers[ns];
  }, [panels]);
  return React.createElement(
    "div",
    { style: { width: size[0], height: size[1] } },
    React.createElement(PanelStack2, {
      className: styles.panelStack,
      onOpen: addToPanelStack,
      onClose: removeFromPanelStack,
      stack: stack,
      ...propsRest,
    })
  );
};
PanelStack.propTypes = {
  panels: PanelsType,
  ns: PropTypes.string,
  size: PropTypes.arrayOf(PropTypes.number),
  propsRest: PropTypes.object,
};

export default PanelStack;
