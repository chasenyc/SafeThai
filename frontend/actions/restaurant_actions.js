export const RECEIVE_RESTAURANTS = "RECEIVE_RESTAURANTS";
export const RECEIVE_RESTAURANT = "RECEIVE_RESTAURANT";
export const REQUEST_RESTAURANTS = "REQUEST_RESTAURANTS";
export const REQUEST_RESTAURANT = "REQUEST_RESTAURANT";

export const requestRestaurants = () => ({
  type: REQUEST_RESTAURANTS
});

export const requestRestaurant = id => ({
  type: REQUEST_RESTAURANT,
  id
});

export const receiveRestaurants = restaurants => ({
  type: RECEIVE_RESTAURANTS,
  restaurants
});

export const receiveRestaurant = restaurant => ({
  type: RECEIVE_RESTAURANT,
  restaurant
});
