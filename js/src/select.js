import React from 'react';
import { MenuItem, Button } from '@blueprintjs/core';
import {
  Select as BlueprintSelect,
  Select2 as BlueprintSelect2,
} from '@blueprintjs/select';
import { highlightText } from './utils/highlight-text.js';

const renderItem = (item, { handleClick, modifiers, query }) => {
  if (!modifiers.matchesPredicate) {
    return null;
  }
  const text = item.label;
  return React.createElement(MenuItem, {
    active: modifiers.active,
    disabled: modifiers.disabled,
    label: item.rightLabel.toString(),
    key: item.key,
    onClick: handleClick,
    text: highlightText(text, query),
  });
};

const filterItem = (query, item) => {
  return item.label.toLowerCase().indexOf(query.toLowerCase()) >= 0;
};

const SelectFactory = (componentVersion) => (props) => {
  const { items, inputId, popoverProps, ...propsRest } = props;

  const [currentItem, setCurrentItem] = React.useState(items[0]);

  const handleItemSelect = React.useCallback((newItem) => {
    setCurrentItem(newItem);
    Shiny.setInputValue(inputId, newItem);
  }, []);

  return React.createElement(
    componentVersion,
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
      text: currentItem.label,
      rightIcon: 'caret-down',
    })
  );
};

export const Select = SelectFactory(BlueprintSelect);
export const Select2 = SelectFactory(BlueprintSelect2);
