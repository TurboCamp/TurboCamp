
import consumer from '../channels/consumer'
import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['contentbox' , 'textarea' , 'file_upload' , 'message_input' , 'submit_btn']
  connect() {
    this.contentboxTarget.scrollTop = this.contentboxTarget.scrollHeight
    if (this.contentboxTarget) {
      let chat_room_id = this.element.dataset.id
      consumer.subscriptions.create(
        { "channel": "ChatRoomChannel", "chat_room_id": chat_room_id },{ 
          received(data) {
            const image = `
            
            <div class="ml-5 pt-1 w-full">
            <span class="text-2xl font-mono mb-2 text-theme-200">${data.send_by}</span>
            <div class="text-xl max-w-full w-full mx-2">
            ${data.message}<a href="${data.image}"><img src="${data.image}" width="150" height="150"></a></div></div>`
            
            const message = `<div class="ml-5 pt-1 w-full">
            <span class="text-2xl font-mono mb-2 text-theme-200">${data.send_by}</span>
            <div class="text-xl max-w-full w-full mx-2">
            ${data.message}</div></div>`
            if (data.image == null){
              document.querySelector("#content").insertAdjacentHTML("beforeend" , message)
            }else{
              document.querySelector("#content").insertAdjacentHTML("beforeend" , image)
            }
          },
        }
      )
    }
  }
  remove_value() {
    setTimeout(()=>{
      this.contentboxTarget.scrollTop = this.contentboxTarget.scrollHeight
      this.message_inputTarget.value = ""
      this.submit_btnTarget.disabled = false
      this.file_uploadTarget.value = ''
      },150) 
    }
}
