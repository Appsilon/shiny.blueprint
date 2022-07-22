import { makeAutoObservable, extendObservable } from 'mobx';
import lodash from 'lodash';

class AppStateStore {
  stateContainer = {};

  constructor() {
    makeAutoObservable(this);
  }

  changeState(observableId, props) {
    if (observableId) {
      if (props === Object(props)) {
        const currentState = this.stateContainer[observableId];
        const newState = lodash.merge({ ...currentState }, props);
        extendObservable(this.stateContainer, { [observableId]: newState });
      } else {
        extendObservable(this.stateContainer, { [observableId]: props });
      }
    }
  }
}

export const appStateStore = new AppStateStore();
