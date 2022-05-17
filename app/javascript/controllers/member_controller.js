import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
    
  join(e){
      e.preventDefault()
      const box = this.element.querySelector("#inputbox")
      box.classList.remove('hidden')
  }
  invite(e){
    e.preventDefault()
    const id = this.element.dataset.id
    const data = this.element.querySelector(".input")
    const formData = new FormData()
    formData.append('email' , data.value)
    Rails.ajax({
        type: "post",
        url: `/api/v1/projects/${id}/search`,
        data: formData,
        success:(resp) => {
            this.element.querySelector("#inputbox").classList.add('hidden')
            data.value = ''
            console.log(resp);
            
        },
    })
    
  }

}