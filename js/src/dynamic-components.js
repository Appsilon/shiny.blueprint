import React from 'react';
import * as Blueprint from '@blueprintjs/core';
import { DynamicProps } from './utils/dynamic-props-wrapper.js';

export const DynamicOverlay = DynamicProps(Blueprint.Overlay);
export const DynamicCallout = DynamicProps(Blueprint.Callout);
export const DynamicButton = DynamicProps(Blueprint.Button);
export const DynamicCard = DynamicProps(Blueprint.Card);
export const DynamicInputGroup = DynamicProps(Blueprint.InputGroup);

export const DynamicCustomComponent = DynamicProps(({ children, ...props }) => {
  return React.createElement(props.componentName, props, children);
})