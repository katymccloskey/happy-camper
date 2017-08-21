 function initMap(params) {

  var current = {lat:params.lat, lng:params.lng};

    var map = new google.maps.Map(document.getElementById('map'), {
       zoom: 10,
       center: current
        });
        var marker = new google.maps.Marker({
          position: current,
          map: map,
          picture: {
            url: "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
            width:  36,
            height: 36
          },
        });
}

$(document).ready(function(campground){
  // initMap();
});


