import * as React from "react";
import PropTypes from "prop-types";
import { Button, PanelStack2, Classes } from "@blueprintjs/core";
import styles from "./PanelStack.module.css";

const PanelsType = PropTypes.arrayOf(
  PropTypes.shape({
    title: PropTypes.string,
    content: PropTypes.node,
  })
);

const NavigationButton = ({ text, onClick, direction }) => {
  const icon =
    direction === "left"
      ? { icon: "chevron-left" }
      : { rightIcon: "chevron-right" };
  return React.createElement(Button, {
    className: Classes.PANEL_STACK_HEADER_BACK,
    minimal: true,
    onClick: onClick,
    small: true,
    text: text,
    ...icon,
  });
};
NavigationButton.propTypes = {
  text: PropTypes.string,
  onClick: PropTypes.func,
  direction: PropTypes.string,
};

const Panel = ({ panels, index, title, openPanel, closePanel }) => {
  const nextIndex = index + 1;
  const prevIndex = index - 1;
  let prevButton, nextButton;
  if (panels[prevIndex]) {
    prevButton = React.createElement(NavigationButton, {
      text: panels[prevIndex].title,
      onClick: closePanel,
      direction: "left",
    });
  }
  if (panels[nextIndex]) {
    const nextTitle = panels[nextIndex].title;
    const openNext = () => {
      openPanel({
        renderPanel: Panel,
        props: { panels, index: nextIndex, title: nextTitle },
      });
    };
    nextButton = React.createElement(NavigationButton, {
      text: nextTitle,
      onClick: openNext,
      direction: "right",
    });
  }
  return React.createElement(
    React.Fragment,
    {},
    React.createElement(
      "div",
      { className: "bp4-panel-stack-header" },
      React.createElement("span", {}, prevButton),
      React.createElement(
        "div",
        { className: "bp4-heading bp4-text-overflow-ellipsis" },
        title
      ),
      React.createElement(
        "span",
        { style: { justifyContent: "end" } },
        nextButton
      )
    ),
    React.createElement(
      "div",
      { style: { padding: 10 } },
      panels[index].content
    )
  );
};
Panel.propTypes = {
  panels: PanelsType,
  index: PropTypes.number,
  title: PropTypes.string,
  openPanel: PropTypes.func,
  closePanel: PropTypes.func,
};

const PanelStack = ({ panels, size, ...propsRest }) => {
  const [stack, setStack] = React.useState([
    {
      renderPanel: Panel,
      props: { panels, index: 0, title: panels[0].title },
    },
  ]);
  const addToPanelStack = React.useCallback(
    (newPanel) => setStack((stack) => [...stack, newPanel]),
    []
  );
  const removeFromPanelStack = React.useCallback(
    () => setStack((stack) => stack.slice(0, -1)),
    []
  );
  return React.createElement(
    "div",
    { style: { width: size[0], height: size[1] } },
    React.createElement(PanelStack2, {
      className: styles.panelStack,
      onOpen: addToPanelStack,
      onClose: removeFromPanelStack,
      showPanelHeader: false,
      stack: stack,
      ...propsRest,
    })
  );
};
PanelStack.propTypes = {
  panels: PanelsType,
  size: PropTypes.arrayOf(PropTypes.number),
  propsRest: PropTypes.object,
};
export default PanelStack;
