import { Controller } from "@hotwired/stimulus"
import "tom-select"

// Connects to data-controller="tom-select-items"
export default class extends Controller {
  static values = {
    autofocus: String
  }
  connect() {
    this.select = new TomSelect(this.element, {
      create: true,
      maxItems: 1,
      valueField: 'name',
      labelField: 'name',
      searchField: ['name', 'email'],
      load: (query, callback) => {
        let url = '/items/tom_search?query=' + encodeURIComponent(query);
        fetch(url,{
          headers: {
            'Content-Type': 'application/json'
          }
        })
            .then(response => response.json())
            .then(json => {
              callback(json.items);
            }).catch(()=> {
          callback();
        });
      },
      render: {
        option: function (data, escape) {
          return '<div>' +
                   '<span class="px-2 text-sky-500">' + escape(data.name) + '</span>' +
                   '|' +
                   '<span class="px-2 text-orange-500">' + escape(data.price) + '</span>' +
                   '|' +
                   '<span class="px-2 text-teal-500">' + escape(data.category) + '</span>'
                  '</div>';
        },
        item: function (data, escape) {
          return '<div class="text-sky-500" data-item-price="'+escape(data.price)+'" data-item-category="'+escape(data.category)+'" >' +
                   escape(data.name) +
                 '</div>'
        }
      }
    })

    if( this.autofocusValue === 'true' ) {
      this.select.control_input.autofocus = true;
      this.select.control_input.focus()
    }


  }

  autocomplete() {
    if (document.querySelector('form select[name="item[name]"]').tomselect.getValue()) {
      let price = document.querySelector('form div[data-item-price]').getAttribute('data-item-price')
      let category = document.querySelector('form div[data-item-category]').getAttribute('data-item-category')

      if (price !== undefined) {
        document.querySelector('form input[name="item[price]"]').value = price
      }
      if (category !== undefined) {
        document.querySelector('form select[name="item[category_name]"]').tomselect.setValue(category)
      }
    }
  }
}
