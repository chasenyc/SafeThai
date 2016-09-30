import { RECEIVE_RESTAURANTS, RECEIVE_RESTAURANT } from '../actions/restaurant_actions';
import merge from 'lodash/merge';

const RestaurantsReducer = (state = {}, action) => {
  switch(action.type){
    case RECEIVE_RESTAURANTS:
      return action.restaurants;
    case RECEIVE_RESTAURANT:
      const newRestaurant = {[action.restaurant.id]: action.restaurant};
      return merge({}, state, newRestaurant);
    default:
      return state;
  }
};

export default RestaurantsReducer;
