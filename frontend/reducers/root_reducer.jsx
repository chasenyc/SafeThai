import {combineReducers} from 'redux';

import RestaurantsReducer from './restaurants_reducer';
import FiltersReducer from './filters_reducer';

export default combineReducers({ // incase we add more later.
  restaurants: RestaurantsReducer,
  filters: FiltersReducer
});
