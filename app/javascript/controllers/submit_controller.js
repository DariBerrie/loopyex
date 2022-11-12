import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit"
export default class extends Controller {
  connect() {
    console.log('submit controller')
  }

  showLoader(e) {
    this.element.innerText = "Loading..."
  }
}
