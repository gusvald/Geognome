// Initialize and add the map
function initMap1() {
  // The location of Uluru
  const uluru = { lat: -25.344, lng: 131.031 };
  // The map, centered at Uluru
  const map1 = new google.maps.Map(document.getElementById("map1"), {
    zoom: 8,
    center: uluru,
  });
  // The marker, positioned at Uluru
  const marker = new google.maps.Marker({
    position: uluru,
    map: map1,
  });
}

window.initMap1 = initMap1;