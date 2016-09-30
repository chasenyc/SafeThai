import React from 'react';
import ReactDOM from 'react-dom';
import { withRouter } from 'react-router';
import MarkerManager from '../../util/marker_manager';

const _getCoordsObj = latLng => ({
  lat: latLng.lat(),
  lng: latLng.lng()
});

let _mapOptions = {
  // center: {lat: 37.773972, lng: -122.431297},
  center: {lat: 40.727826, lng: -73.992704},
  zoom: 15
};

class restaurantMap extends React.Component {

  componentDidMount() {
    const map = this.refs.map;
    this.map = new google.maps.Map(map, _mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    if(this.props.singlerestaurant) {
      this.props.requestrestaurant(this.props.restaurantId);
    } else {
      this._registerListeners();
      this.MarkerManager.updateMarkers(this.props.restaurants);
    }
  }

  componentDidUpdate() {
    if(this.props.singlerestaurant){
      this.MarkerManager.updateMarkers([this.props.restaurants[Object.keys(this.props.restaurants)[0]]]);
    } else {
      this.MarkerManager.updateMarkers(this.props.restaurants);
    }
  }

  _registerListeners() {
    google.maps.event.addListener(this.map, 'idle', () => {
      const { north, south, east, west } = this.map.getBounds().toJSON();
      const bounds = {
        northEast: { lat:north, lng: east },
        southWest: { lat: south, lng: west } };
      this.props.updateFilter('bounds', bounds);
    });
  }

  _handleMarkerClick(restaurant) {
    this.props.router.push("restaurants/" + restaurant.id );
  }

  render() {
    return <div className="map" ref="map">Map</div> ;
  }
}

export default withRouter(restaurantMap);
