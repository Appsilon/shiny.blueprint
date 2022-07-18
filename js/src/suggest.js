import React from 'react';
import { MenuItem } from '@blueprintjs/core';
import {
  Suggest as BlueprintSuggest,
  Suggest2 as BlueprintSuggest2,
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

const SuggestFactory = (componentVersion) => (props) => {
  const { items, inputId, popoverProps, ...propsRest } = props;

  const handleItemSelect = React.useCallback(
    (newItem) => Shiny.setInputValue(inputId, newItem),
    []
  );

  return React.createElement(
    componentVersion,
    {
      items,
      ...propsRest,
      itemPredicate: filterItem,
      itemRenderer: renderItem,
      inputValueRenderer: (item) => item.label,
      onItemSelect: handleItemSelect,
      popoverProps: {
        ...popoverProps,
        usePortal: false,
      }
    }
  );
};

export const Suggest = SuggestFactory(BlueprintSuggest);
export const Suggest2 = SuggestFactory(BlueprintSuggest2);
