import React from 'react';
import PropTypes from 'prop-types';
import { MenuItem } from '@blueprintjs/core';
import { Suggest2 } from '@blueprintjs/select';
import { highlightText } from './utils/highlight-text.js';

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

export const Suggest = ({ items, inputId, popoverProps, ...propsRest }) => {
  const handleItemSelect = React.useCallback(
    (newItem) => Shiny.setInputValue(inputId, newItem),
    []
  );

  return React.createElement(
    "div",
    { style: { width: "fit-content" } },
    React.createElement(
      Suggest2,
      {
        items,
        ...propsRest,
        itemPredicate: filterItem,
        itemRenderer: renderItem,
        inputValueRenderer: (item) => item.text,
        onItemSelect: handleItemSelect,
        popoverProps: {
          ...popoverProps,
          usePortal: false,
        }
      }
    )
  );
};

Suggest.propTypes = propTypes;
