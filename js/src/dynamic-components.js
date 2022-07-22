import React from 'react';
import * as Blueprint from '@blueprintjs/core';
import { DynamicProps } from './utils/dynamic-props-wrapper.js';

export const Overlay = DynamicProps(Blueprint.Overlay);
export const Callout = DynamicProps(Blueprint.Callout);
export const Button = DynamicProps(Blueprint.Button);
export const Card = DynamicProps(Blueprint.Card);