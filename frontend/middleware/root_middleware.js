import { applyMiddleware } from 'redux';

import RestaurantMiddleware from '../middleware/restaurant_middleware';

const RootMiddleware = applyMiddleware(
  RestaurantMiddleware
);

export default RootMiddleware;
