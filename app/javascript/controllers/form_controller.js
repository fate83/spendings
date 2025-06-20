import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-on-change"
export default class extends Controller {
  connect() {
    console.log(this.element)
  }
  submit(event) {
    console.log(this.element)
    event.preventDefault()

    this.element.requestSubmit()
  }
}
