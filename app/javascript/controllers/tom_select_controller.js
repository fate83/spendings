import { Controller } from "@hotwired/stimulus"
import "tom-select"

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = {
    autofocus: String
  }
  connect() {
    this.select = new TomSelect(this.element, {
      create: true,
      maxItems: 1
    })

    if( this.autofocusValue === 'true' ) {
      this.select.control_input.autofocus = true;
      this.select.control_input.focus()
    }
  }
}
