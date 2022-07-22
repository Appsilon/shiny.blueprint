import React from 'react';
import { appStateStore } from '../state-store.js';
import { autorun } from 'mobx';
import { observer } from 'mobx-react';

export const DynamicProps = (component) =>
  observer((initProps) => {
    const { id, bindObservables, ...restProps } = initProps;
    React.useEffect(() => {
      appStateStore.changeState(id, restProps);
      if (bindObservables) {
        bindObservables.map((config) => {
          const { observer, observable } = config;
          if (!appStateStore.stateContainer[observable]) {
            appStateStore.stateContainer[observable] = restProps[observer];
          }
          autorun(() => {
            appStateStore.stateContainer[id][observer] =
              appStateStore.stateContainer[observable];
          });
        });
      }
    }, []);
    const props = appStateStore.stateContainer[id];
    return props ? React.createElement(component, props, props.children) : null;
  });
