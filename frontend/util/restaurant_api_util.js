export const fetchRestaurants = (filters, success) => {
  $.ajax({
    method: 'GET',
    url: 'api/restaurants',
    data: filters,
    success
  });
};

export const fetchRestaurant = (id, success) => {
  $.ajax({
    method: 'GET',
    url: `api/restaurants/${id}`,
    success
  });
};
