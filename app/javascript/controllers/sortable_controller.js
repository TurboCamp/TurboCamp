import { Controller } from 'stimulus'
import Sortable from 'sortablejs'

export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      onChange: function(/**Event*/evt) {
        evt.newIndex // most likely why this event is used is to get the dragging element's current index
        // same properties as onEnd
      }
    })
  }
}
