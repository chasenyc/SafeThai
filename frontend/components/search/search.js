import React from 'react';

import FilterForm from './filter_form';
import RestaurantIndex from './restaurant_index';
import RestaurantMap from './../restaurant_map/restaurant_map';

const Search = ({restaurants, minGrade, maxGrade, updateFilter}) => (
  <div className="user-pane">
    <div className="left-half">
      <RestaurantMap
        restaurants={restaurants}
        updateFilter={updateFilter}
        singleRestaurant={false}/>
    </div>
    <div className="right-half">
      <FilterForm
        minGrade={minGrade}
        maxGrade={maxGrade}
        updateFilter={updateFilter}/>
      <RestaurantIndex restaurants={restaurants}/>
    </div>
  </div>
);

export default Search;
