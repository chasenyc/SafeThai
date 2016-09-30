import React from 'react';
import RestaurantIndexItem from './restaurant_index_item';

const RestaurantIndex = ({restaurants}) => {
  return (
    <div>
      <h1>Restaurants: </h1>
      {
        restaurants.map( restaurant => (
          <RestaurantIndexItem restaurant={restaurant} key={restaurant.id} />
        ))
      }
    </div>
  );
};

export default RestaurantIndex;
