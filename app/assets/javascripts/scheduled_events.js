// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function initMap() {
  var eventMap = document.querySelector('.map');
  var uluru = { lat: Number(eventMap.dataset.lat), lng: Number(eventMap.dataset.long) };
  var map = new google.maps.Map(document.querySelector('.map'), {
    zoom: 15,
    center: uluru
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}
