import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'
import Rails from '@rails/ujs'

export default class extends Controller {
  static values = {
    status: String
  }
  connect() {
    Sortable.create(this.element, {
      group: 'shared',
      onChange: this.end.bind(this),
    })
  }
  end(event) {

    let id = event.item.dataset.id
    if (this.statusValue === 'a') {
      status = 'todos'
    } else if (this.statusValue === 'b') {
      status = 'pending'
    } else if (this.statusValue === 'c') {
      status = 'finish'
    }

    const data = new FormData()

    data.append("position", event.newIndex + 1)
    data.append("status", status)

    Rails.ajax({
      url: `./todo_lists/${id}/move`,
      type: 'PATCH',
      data: data
    })
  }
}
