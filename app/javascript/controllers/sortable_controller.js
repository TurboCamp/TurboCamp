import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'
import Rails from '@rails/ujs'
// import Sortable from 'stimulus-sortable'

export default class extends Controller {
  static targets = ['a','b','c'];
  connect() {
    
    Sortable.create(this.element, {
      group: 'shared',
      // onEnd: this.end.bind(this),
      onChange: this.end.bind(this)
    })
    
  }
  end(event) {
    let id = event.item.dataset.id
    // let status = event.item.dataset.status
    console.log(event.item.parentNode.firstChild.textContent);
    console.log(event.item.previousSibling.textContent);
    if (event.item.parentNode.firstChild.textContent === 'Todos') {
      status = ('a')    
    }
    if (event.item.parentNode.firstChild.textContent === 'Pending') {
      status = ('b')    
    }
    if (event.item.parentNode.firstChild.textContent === 'Finish') {
      status = ('c')    
    }
    console.log(status);
    // let status = event.item.dataset.status
    let data = new FormData()
    console.log(event);

    data.append("position", event.newIndex + 1)
    data.append("status", status)

    // console.log(event.newIndex);
    // console.log(data);
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
