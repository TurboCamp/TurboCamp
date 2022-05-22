
import consumer from '../channels/consumer'
import { Controller } from 'stimulus'
export default class extends Controller {
  static targets = ['contentbox']
  connect() {
    this.contentboxTarget.scrollTop = this.contentboxTarget.scrollHeight
    if (this.contentboxTarget) {
      let chat_room_id = this.element.dataset.id
      console.log(chat_room_id)
      consumer.subscriptions.create(
        { "channel": "ChatRoomChannel", "chat_room_id": chat_room_id },
        { 
          received(data) {
           console.log(data)
           const message = `<div class="w-max">
          <span class="text-xs block">${data.send_by}</span>
          <div class=" px-3 py-2 bg-gray-200 opacity-3 rounded-lg w-max">
          ${data.message} </div></div>`
          document.querySelector("#content").insertAdjacentHTML("beforeend" , message)
          },
        }
      )
    }
  }
  remove_value() {
    setTimeout(()=>{
      this.element.querySelector("#content_text").value = ""
      this.element.querySelector("input[name='commit']").disabled = false
      this.contentboxTarget.scrollTop = this.contentboxTarget.scrollHeight
      },150) 
    }
}