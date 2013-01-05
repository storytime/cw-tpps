    function initialize() {
      var mapOptions = {
        zoom: 8,
        center: new google.maps.LatLng(-34.397, 150.644),
        mapTypeId: google.maps.MapTypeId.TERRAIN
      }
      var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
      google.maps.event.addListener(map, 'click', function(e) {
      placeMarker(e.latLng, map);
      geocoder = new google.maps.Geocoder();
      var infowindow = new google.maps.InfoWindow();
      geocoder.geocode({'latLng': e.latLng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
            if (results[0]) {
              var country;
              for (i = 0; i < results[0].address_components.length; ++i) {
                  var component = results[0].address_components[i];
                  if (!country && component.types.indexOf("country") > -1){
                      country = component.long_name;
                    }
              }
              document.getElementById("country").value=country;
                }
              }
            });
              
      infowindow.open(map, this);

      });
    }

    function loadScript() {
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
      document.body.appendChild(script);
    }
    
      function placeMarker(position, map) {
        var marker = new google.maps.Marker({
          position: position,
          map: map, draggable:true
        });
        map.panTo(position);
    }     
    window.onload = loadScript;