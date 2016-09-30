// Restaurant API Util
import { fetchRestaurants,
         fetchRestaurant,
       } from '../util/restaurant_api_util';
// Restaurant Action
import { requestRestaurants,
         receiveRestaurant,
         receiveRestaurants,
         REQUEST_RESTAURANTS,
         REQUEST_RESTAURANT,
       } from '../actions/restaurant_actions';
// Filter Constants
import { UPDATE_FILTER } from '../actions/filter_actions';

export default ({getState, dispatch}) => next => action => {
  const restaurantsSuccess = data => dispatch(receiveRestaurants(data));
  const restaurantSuccess = data => dispatch(receiveRestaurant(data));
  const result = next(action);
  switch(action.type){
    case REQUEST_RESTAURANTS:
      const filters = getState().filters;
      fetchRestaurants(filters, restaurantsSuccess);
      break;
    case REQUEST_RESTAURANT:
      fetchRestaurant(action.id, restaurantSuccess);
      break;
    case UPDATE_FILTER:
      dispatch(requestRestaurants());
      break;
    default:
      break;
  }
  return result;
};
