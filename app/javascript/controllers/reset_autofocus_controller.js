import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-form"
export default class extends Controller {
  connect() {
  }

  reset() {
    var form = document.querySelector('form');
    this.element.querySelector('[autofocus]').focus();
  }
}
