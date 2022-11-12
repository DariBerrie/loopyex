import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show-map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object,
  };
  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.show_map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });

    // Add marker to map
    this.#addMarkerToMap();
    this.#fitMapToMarker();
  }

  #addMarkerToMap() {
    // Custom marker
    // const customMarker = document.createElement("div");
    // customMarker.className = "marker";
    // customMarker.style.backgroundImage = `url('${markers.image_url}')`;
    // customMarker.style.backgroundSize = "contain";
    // customMarker.style.width = "40px";
    // customMarker.style.height = "40px";
    let mark = this.markerValue;

    mark = new mapboxgl.Marker().setLngLat([mark.lng, mark.lat]).addTo(this.show_map);
  }

  #fitMapToMarker() {
    // const bounds = new mapboxgl.LngLatBounds()
    // let mark = this.markerValue
    // mark = bounds.extend([ mark.lng, mark.lat ])
    // this.show_map.fitBounds(bounds, { padding: 10, maxZoom: 50, duration: 0 })
    let mark = this.markerValue;
    this.show_map.jumpTo({
      center: [mark.lng, mark.lat],
      zoom: 12,
    });
  }
}
