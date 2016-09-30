/* global google:false */

export default class MarkerManager {
  constructor(map){
    this.map = map;
    this.markers = [];
    //permanently bind instance methods
    this._createMarkerFromRestaurant = this._createMarkerFromRestaurant.bind(this);
    this._removeMarker = this._removeMarker.bind(this);
    this._markersToRemove = this._markersToRemove.bind(this);
  }

  updateMarkers(restaurants){
    this.restaurants = restaurants;
    this._restaurantsToAdd().forEach(this._createMarkerFromRestaurant);
    this._markersToRemove().forEach(this._removeMarker);
  }

  _restaurantsToAdd() {
    const currentRestaurants = this.markers.map( marker => marker.restaurantId );
    return this.restaurants.filter( restaurant => !currentRestaurants.includes(restaurant.id) );
  }

  _markersToRemove(){
    const restaurantIds = this.restaurants.map( restaurant => restaurant.id );
    return this.markers.filter( marker => !restaurantIds.includes(marker.restaurantId) );
  }

  _createMarkerFromRestaurant(restaurant) {
    const pos = new google.maps.LatLng(restaurant.lat, restaurant.lng);
    const marker = new google.maps.Marker({
      position: pos,
      map: this.map,
      restaurantId: restaurant.id
    });
    this.markers.push(marker);
  }

  _removeMarker(marker) {
    const idx = this.markers.indexOf( marker );
    this.markers[idx].setMap(null);
    this.markers.splice(idx, 1);
  }
}
