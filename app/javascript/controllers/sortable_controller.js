import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'
import Rails from '@rails/ujs'
// import Sortable from 'stimulus-sortable'

export default class extends Controller {
  static values = {
    status: String
  }
  connect() {
    console.log(this.statusValue);
    
    Sortable.create(this.element, {
      group: 'shared',
      // onEnd: this.end.bind(this),
      onChange: this.end.bind(this),
      // onMove: function (/**Event*/evt, /**Event*/originalEvent) {

      //   // console.log(evt);
      //   evt.dragged; // dragged HTMLElement
      //   evt.draggedRect; // DOMRect {left, top, right, bottom}
      //   evt.related; // HTMLElement on which have guided
      //   evt.relatedRect; // DOMRect
      //   evt.willInsertAfter; // Boolean that is true if Sortable will insert drag element after target by default
      //   originalEvent.clientY; // mouse position
      //   // return false; — for cancel
      //   // return -1; — insert before target
      //   // return 1; — insert after target
      //   // return true; — keep default insertion point based on the direction
      //   // return void; — keep default insertion point based on the direction
      // },
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
    console.log(this.statusValue);
    console.log(status);
    const data = new FormData()

    data.append("position", event.newIndex + 1)
    data.append("status", status)

    Rails.ajax({
      url: `./todo_lists/${id}/move`,
      type: 'PATCH',
      data: data,
      success: (resp)=>{
        console.log(resp);
      },
      error: (err)=>{
          console.log(err);
      }
    })
  }
}
