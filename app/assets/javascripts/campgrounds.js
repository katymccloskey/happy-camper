 function initMap(params) {

  var current = {lat:params.lat, lng:params.lng};

    var map = new google.maps.Map(document.getElementById('map'), {
       zoom: 10,
       center: current
        });
        var marker = new google.maps.Marker({
          position: current,
          map: map
        });
}

$(document).ready(function(campground){
  // initMap();
});


