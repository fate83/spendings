import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-autofocus"
export default class extends Controller {
  connect() {
    console.log(this.element)
  }

  reset() {
    var form = document.querySelector('form');
    this.element.querySelector('[autofocus]').focus();
  }
}
