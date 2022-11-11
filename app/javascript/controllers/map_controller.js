import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };
  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });

    // Add marker to map
    this.#addMarkersToMap();
    // Fit map to markers
    this.#fitMapToMarkers();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div");
      customMarker.className = "marker";
      customMarker.style.backgroundImage = `url('${marker.image_url}')`;
      customMarker.style.backgroundSize = "contain";
      customMarker.style.width = "50px";
      customMarker.style.height = "50px";
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      new mapboxgl.Marker(customMarker).setLngLat([marker.lng, marker.lat]).setPopup(popup).addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
