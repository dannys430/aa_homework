import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ? JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  
  // Phase 1
  // store.dispatch = addLoggingToDispatch(store)

  // Phase 2
  // store = applyMiddlewares(store, addLoggingToDispatch)
  
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});


// Phase 1: Logging (logs the old state, the action, and the new state)
// function addLoggingToDispatch(store) {
//   const localStore = store.dispatch;
//   return function(action) {
//     console.log(store.getState());
//     console.log(action);
//     localStore(action);
//     console.log(store.getState());
//   }
// }


// Phase 2: Refactoring (this version doesn't overwrite 'store.dispatch'.  In this version, we're making our own applyMiddlewares function that will run 1 or more middlewares)
// ES5
// function addLoggingToDispatch(store) {
//   return function(next) {
//     return function(action) {
//       console.log(next(action))
//     }
//   }
// }

// ES6
// const addLoggingToDispatch = store => next => action => console.log(next(action))

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach(middleware => {
//     dispatch = middleware(store)(dispatch)
//   })
//   return Object.assign({}, store, {dispatch})
// }

// Phase 3: using applyMiddleware function that's part of the redux npm package

