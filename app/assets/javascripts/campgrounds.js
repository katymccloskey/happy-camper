var map;
var infoWindow;
function initMap(lat,lng) {
  // var austin = {lat: 30.2672, lng: -97.7431};
  var latitude = parseFloat(lat);
  var longitude = parseFloat(lng);
  // debugger;
  var current = {lat:latitude, lng:longitude}

  map = new google.maps.Map(document.getElementById('map-container'), {
    center: current,
        zoom: 12
  });

  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  // service.nearbySearch({
    var request = {
    location: map.getCenter(),
    radius: 2500,
    query: ['campgrounds'],
    // query: current

  };
  service.textSearch(request, callback);
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}
// Run the initialize function when the window has finished loading.

$( document ).ready(function() {
    console.log( "ready!" );
    var loc;


  $.getJSON('https:/ipinfo.io', function(d){
    console.log("assigning location data");
    loc = d.loc.split(",");

     var latitude = loc[0];
     var longitude = loc[1];
     initMap(latitude,longitude);
  });


});
