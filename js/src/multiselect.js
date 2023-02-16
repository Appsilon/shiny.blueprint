import React from 'react';
import PropTypes from 'prop-types';
import { MenuItem } from '@blueprintjs/core';
import { MultiSelect2 } from '@blueprintjs/select';
import { highlightText } from './utils/highlight-text.js';

const filterItem = (query, item) => {
  return item.text.toLowerCase().indexOf(query.toLowerCase()) >= 0;
};

const tagRenderer = (item) => item.text;

const propTypes = {
  items: PropTypes.array,
  selected: PropTypes.string,
  inputId: PropTypes.string,
  popoverProps: PropTypes.object,
};

export const MultiSelect = ({ items, selected, inputId, popoverProps, ...propsRest }) => {

  const [selectedItems, setSelectedItems] = React.useState(
    items.filter((item) => selected.includes(item.text))
  );

  React.useEffect(() => {
    Shiny.setInputValue(inputId, { selectedItems });
  }, [selectedItems]);

  const isSelectedItem = React.useCallback(
    (item) =>
      selectedItems.filter((selectedItem) => selectedItem.key === item.key)
        .length > 0,
    [selectedItems]
  );

  const selectItem = React.useCallback(
    (newItem) => {
      setSelectedItems([...selectedItems, newItem]);
    },
    [selectedItems]
  );

  const deselectItem = React.useCallback(
    (item) => {
      setSelectedItems(
        selectedItems.filter((selectedItem) => selectedItem.key !== item.key)
      );
    },
    [selectedItems]
  );

  const handleItemRemove = React.useCallback((removedItem) => {
    deselectItem(removedItem);
  }, [deselectItem]);

  const handleItemSelect = React.useCallback((newItem) => {
    if (!isSelectedItem(newItem)) {
      selectItem(newItem);
    } else {
      deselectItem(newItem);
    }
  }, [isSelectedItem, selectItem, deselectItem]);

  const renderItem = React.useCallback(
    (item, { handleClick, modifiers, query }) => {
      if (!modifiers.matchesPredicate) {
        return null;
      }
      return React.createElement(MenuItem, {
        icon: isSelectedItem(item) ? 'tick' : 'blank',
        selected: modifiers.active,
        active: modifiers.active,
        disabled: modifiers.disabled,
        label: item.label.toString(),
        key: item.key,
        onClick: handleClick,
        text: highlightText(item.text, query),
      });
    },
    [selectedItems]
  );

  return React.createElement(
    "div",
    { style: { width: "fit-content" } },
    React.createElement(MultiSelect2, {
      items,
      ...propsRest,
      itemPredicate: filterItem,
      itemRenderer: renderItem,
      onItemSelect: handleItemSelect,
      onRemove: handleItemRemove,
      popoverProps: {
        ...popoverProps,
        usePortal: false,
      },
      selectedItems,
      tagRenderer,
    })
  );
};

MultiSelect.propTypes = propTypes;
