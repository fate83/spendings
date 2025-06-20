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

    // this.select = new TomSelect(this.element, {
    //   plugins: ['remove_button'],
    //   valueField: 'id',
    //   labelField: 'name',
    //   searchField: ['name', 'email'],
    //   maxItems: 1,
    //   selectOnTab: true,
    //   placeholder: "Select user",
    //   closeAfterSelect: true,
    //   hidePlaceholder: false,
    //   preload: true,
    //   create: false,
    //   openOnFocus: true,
    //   highlight: true,
    //   sortField: {
    //     field: "name",
    //     direction: "asc"
    //   },
    //   searchField: 'name',
    //   load: (search, callback) => {
    //     fetch(url)
    //         .then(response => response.json())
    //         .then(json => {
    //           callback(json);
    //         }).catch(() => {
    //       callback();
    //     });
    //   },
    //   render: {
    //     option: function (data, escape) {
    //       return '<div>' +
    //           '<span class="block">' + escape(data.name) + '</span>' +
    //           '<span class="text-gray-400">' + escape(data.email) + '</span>' +
    //           '</div>';
    //     }
    //   }
    // });
  }
}
