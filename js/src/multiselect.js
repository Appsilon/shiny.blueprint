import React from 'react';
import { MenuItem } from '@blueprintjs/core';
import {
  MultiSelect as BlueprintMultiSelect,
  MultiSelect2 as BlueprintMultiSelect2,
} from '@blueprintjs/select';
import { highlightText } from './utils/highlight-text.js';
import { ShinyProxy } from '@/shiny.react';

const filterItem = (query, item) => {
  return item.label.toLowerCase().indexOf(query.toLowerCase()) >= 0;
};

const tagRenderer = (item) => item.label;

const MultiSelectFactory = (componentVersion) => (props) => {
  const { items, inputId, popoverProps, ...propsRest } = props;

  const [selectedItems, setSelectedItems] = React.useState(
    items.filter((item) => item.selected)
  );

  React.useEffect(() => {
    ShinyProxy.setInputValue(inputId, { selectedItems });
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
      const text = item.label;
      return React.createElement(MenuItem, {
        icon: isSelectedItem(item) ? 'tick' : 'blank',
        selected: modifiers.active,
        active: modifiers.active,
        disabled: modifiers.disabled,
        label: item.rightLabel.toString(),
        key: item.key,
        onClick: handleClick,
        text: highlightText(text, query),
      });
    },
    [selectedItems]
  );

  return React.createElement(componentVersion, {
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
  });
};

export const MultiSelect = MultiSelectFactory(BlueprintMultiSelect);
export const MultiSelect2 = MultiSelectFactory(BlueprintMultiSelect2);
