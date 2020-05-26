import React from 'react';

import GiphysIndex from './giphys_index';
import { fetchSearchGiphys } from '../util/api_util'
import configureStore from '../store/store.js'
import { receiveSearchGiphys } from '../actions/giphy_actions'

const store = configureStore()

Window.store = store

Window.fetchSearchGiphys = fetchSearchGiphys
Window.receiveSearchGiphys = receiveSearchGiphys
