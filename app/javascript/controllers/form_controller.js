import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  connect() {
  }
  submit(event) {
    event.preventDefault()

    this.element.requestSubmit()
  }
  reset_items_form() {
    console.log("ASD")
    console.log('asd')
    document.querySelector('form select[name="item[name]"]').tomselect.clear()
    document.querySelector('form select[name="item[category_name]"]').tomselect.clear()
    document.querySelector('form input[name="item[price]"]').value = ''
  }
}
