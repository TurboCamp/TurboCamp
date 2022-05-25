import { Controller } from "stimulus"
import Rails from "@rails/ujs"
import Sortable from "sortablejs"

export default class extends Controller {

    connect(){
        Sortable.create(this.element, {
            onEnd: function({ newIndex, item }){
                const { id } = item.dataset

                const data = new FormData()
                data.append("new_index", newIndex + 1)
                
                Rails.ajax({
                    type: "patch",
                    url: `todo_lists/${id}/sort`,
                    data,
                    success: (resp)=>{
                        console.log(resp);
                    },
                    error: (err)=>{
                        console.log(err);
                    }

                })

            }
        })
    }
}