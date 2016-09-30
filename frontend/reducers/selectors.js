export const selectRestaurant = (restaurants, id) => restaurants[id] || {};

export const asArray = (obj) => Object.keys(obj).map(key => obj[key]);
