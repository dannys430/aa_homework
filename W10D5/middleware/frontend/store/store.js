import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  // const store = createStore(rootReducer, preloadedState);  // original
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));    // Phase 3  
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;

const addLoggingToDispatch = store => next => action => console.log(next(action))   // Phase 3


