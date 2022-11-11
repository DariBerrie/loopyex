import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    window.addEventListener("scroll", this.stickyNavbar);
  }

  stickyNavbar() {
    const navbar = document.querySelector(".navbar");
    const sticky = navbar.offsetTop;
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("opacity-on-scroll");
    } else {
      navbar.classList.remove("opacity-on-scroll");
    }
  }
}
