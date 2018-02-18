// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function initMap() {
  var styledMapType = new google.maps.StyledMapType(
    [
      {
        "featureType": "poi",
        "elementType": "labels.text",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.business",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "transit",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }
    ],
    {name: 'Simple'}
  );

  var eventMap = document.querySelector('.map');
  var uluru = {
    lat: Number(eventMap.dataset.lat),
    lng: Number(eventMap.dataset.long)
  };

  var map = new google.maps.Map(eventMap, {
    center: uluru,
    zoom: 15,
    mapTypeControlOptions: {
      mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain', 'styled_map']
    }
  });

  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });

  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');
}
