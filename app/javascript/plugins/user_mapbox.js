import mapboxgl from 'mapbox-gl';

const userMapbox = () => {
  const mapElement = document.getElementById('userMap');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'userMap',
      style: 'mapbox://styles/mapbox/streets-v10'


    });

    $('#myModalUser').on('shown.bs.modal', function() {
        map.resize();
      });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {

      const popup = new mapboxgl.Popup( { offset: 0 }).setHTML(marker.infoWindow);
      new mapboxgl.Marker()

        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });



    if (markers.length === 0) {
      map.setZoom(4)
    } else if (markers.length === 1) {
      map.setZoom(15);
      map.setCenter([markers[0].lng, markers[0].lat])
    } else {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach ((marker) => {
        bounds.extend([marker.lng, marker.lat]);
      });





      map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 3000 } )
    }

     map.addControl(
        new mapboxgl.GeolocateControl({
        positionOptions: {
        enableHighAccuracy: true
        },
        fitBoundsOptions: {
          maxZoom: 12
        },
        trackUserLocation: true
        }),
        'top-left'
      );

  }
};

export { userMapbox };