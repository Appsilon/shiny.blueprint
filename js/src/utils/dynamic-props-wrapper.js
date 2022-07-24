import React from 'react';
import { appStateStore } from '../state-store.js';
import { autorun } from 'mobx';
import { observer } from 'mobx-react';

export const DynamicProps = (component) => {
  return observer((initProps) => {
    const { componentStateKey, ...restProps } = initProps;
    React.useEffect(() => {
      appStateStore.changeState(componentStateKey, restProps);
      Object.entries(restProps).forEach(([key, value]) => {
        const { observables } = value;
        if (observables) {
          Object.entries(observables).forEach(([observableId, initialValue]) => {
            if (!appStateStore.stateContainer[observableId]) {
              appStateStore.stateContainer[observableId] =
                initialValue !== null && initialValue !== undefined
                  ? initialValue
                  : undefined;
            }
            autorun(() => {
              if (appStateStore.stateContainer[observableId] !== undefined) {
                appStateStore.stateContainer[componentStateKey][key] =
                  appStateStore.stateContainer[observableId];
              }
            });
          });
        }
      });
    }, []);
    const props = appStateStore.stateContainer[componentStateKey];
    return props ? React.createElement(component, props, props.children) : null;
  });
};
