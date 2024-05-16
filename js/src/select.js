import React from "react";
import PropTypes from "prop-types";
import { MenuItem, Button } from "@blueprintjs/core";
import { Select as SelectBlueprint } from "@blueprintjs/select";
import { highlightText } from "./utils/highlight-text";

const renderItem = (item, { handleClick, modifiers, query }) => {
  if (!modifiers.matchesPredicate) {
    return null;
  }
  return React.createElement(MenuItem, {
    active: modifiers.active,
    disabled: modifiers.disabled,
    label: item.label.toString(),
    key: item.key,
    onClick: handleClick,
    text: highlightText(item.text, query),
  });
};

const propTypes = {
  items: PropTypes.array,
  selected: PropTypes.string,
  inputId: PropTypes.string,
  popoverProps: PropTypes.object,
};

const filterItem = (query, item) => {
  return item.text.toLowerCase().indexOf(query.toLowerCase()) >= 0;
};

const Select = ({ items, selected, inputId, popoverProps, ...propsRest }) => {
  const [currentItem, setCurrentItem] = React.useState(
    items.find(({ text }) => text === selected)
  );

  React.useEffect(() => Shiny.setInputValue(inputId, currentItem), []);

  const handleItemSelect = React.useCallback((newItem) => {
    setCurrentItem(newItem);
    Shiny.setInputValue(inputId, newItem);
  }, []);

  return React.createElement(
    "div",
    { style: { width: "fit-content" } },
    React.createElement(
      SelectBlueprint,
      {
        items,
        ...propsRest,
        itemPredicate: filterItem,
        itemRenderer: renderItem,
        onItemSelect: handleItemSelect,
        popoverProps: {
          ...popoverProps,
          usePortal: false,
        },
      },
      React.createElement(Button, {
        text:
          currentItem.text +
          (currentItem.label ? ` (${currentItem.label})` : ""),
        rightIcon: "caret-down",
      })
    )
  );
};

Select.propTypes = propTypes;
export default Select;
