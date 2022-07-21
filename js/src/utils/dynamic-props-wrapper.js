import React from 'react';
import { useDynamicProps } from './use-dynamic-props.js';

export const DynamicProps = (component) => (initProps) => {
  const { inputId, ...restProps } = initProps;
  const props = useDynamicProps(inputId, restProps);

  return React.createElement(component, props, restProps.children);
}