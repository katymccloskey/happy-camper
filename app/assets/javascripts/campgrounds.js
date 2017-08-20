var map;
var infowindow;

function initMap(lat,lng) {

  var latitude = parseFloat(lat);
  var longitude = parseFloat(lng);
  var current = {lat:latitude, lng:longitude};

  map = new google.maps.Map(document.getElementById('map-container'), {
    center: current,
    zoom: 10
  });

  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  // service.nearbySearch({
    var request = {
    location: map.getCenter(),
    radius: 2500,
    query: 'campgrounds',

  };
  service.textSearch(request, callback);
}

function callback(results, status) {
  $("#campground-list").html(addHtmlContent(results));
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

//-------------------------------add campsites to HTML layout-----------------------
function addHtmlContent(result) {
  // $('#add-campgrounds').children().empty();
  $('#add-campgrounds').children().remove();
  var template = $('#campground-list').html();
    for ( var i = 0; i < result.length; i++ ) {
      // var rendered = Mustache.render(template, result[i]);
      console.log(result[i])
      if (result[i].photos){
         var rendered = Mustache.render(template, result[i]);
        console.log(result[i].photos[0].html_attributions);
      }

      $('#add-campgrounds').append(rendered);
    }
}


// gets search result and updates map
function initSearch(search_term) {

  var map = new google.maps.Map(document.createElement('div'));
  var infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);

  service.textSearch({
    query: search_term
  }, callback);

  function callback(result) {
    result = result.shift();

    var latitude = result.geometry.location.lat();
    var longitude = result.geometry.location.lng();

   initMap(latitude,longitude);
  }
}


// Run the initialize function when the window has finished loading.

$( document ).ready(function() {
    console.log( "ready!" );


  $.getJSON('https:/ipinfo.io', function(d){
    console.log("assigning location data");
    loc = d.loc.split(",");

     var latitude = loc[0];
     var longitude = loc[1];
     initMap(latitude,longitude);

  });

 $('.search-submit').on('submit', function(event){
    event.preventDefault();
    var $form = $(this);

    var search = $form.find('.searchTerm').val();
    initSearch(search);
  });


});
