## Safe Thai

This project is live [here](https://safethai.herokuapp.com/).

Safe Thai is a small web application to show you where you can safely eat Thai food without taking any risks to your well-being. This was built using Rails, React + Redux utilizing a Postgres database.

### Main Functionality:

* Display lists of Thai restaurants
* Filter results by grade range
* Non Patented SmartLinking(tries to link to best website for restaurant)
* Utilizes Google Maps API and Google Geocoding API (to store latitude and longitude)
* Updates list of restaurants based on bounds of google maps

### Missing Features
* Individual pages for restaurants. Some backend api infrastructure is built but frontend still needs implementation
* Some kind of map marker animation when hovering over restaurant card
* Setup scheduled rake tasks to continually update database
* I wanted to serve more than just Thai restaurants; however, in order to store `lat` and `lng` for all restaurants I would leave the free tier of Google Geocoding API rate limits
