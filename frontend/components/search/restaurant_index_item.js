import React from 'react';
import { hashHistory } from 'react-router';

class RestaurantIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const restaurant = this.props.restaurant;
    const url = "https://duckduckgo.com/?q=\\" + restaurant.name + " NYC"
    return (
      <div className="restaurant-index-item">
        <div className="index-item-info">

          <span className="index-item-category">Name</span>
          <span className="index-item-copy">
            <a target="_blank" href={url}>{restaurant.name}</a>
          </span>

          <span className="index-item-category">Address</span>
          <span className="index-item-copy">
            {restaurant.address}
          </span>

          <span className="index-item-category">Grade</span>
          <span className="index-item-copy">
            {restaurant.grade}
          </span>
        </div>
      </div>
    );
  }
}

export default RestaurantIndexItem;
