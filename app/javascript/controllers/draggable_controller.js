import { Controller } from '@hotwired/stimulus'
import Sortable from '@shopify/draggable'
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = ['todolist']
  connect() {
    if (this.hasTodoTarget) {
      const sortable = new Sortable(this.todoTargets, {
        draggable: 'li'
      })
      sortable.on('sortable:stop', function (e) {
        let url = e.dragEvent.source.getAttribute('data-url')
        let id = e.item.dataset.id
        let data = new FormData()

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
      })
    }
  }

}
