
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
            document.querySelector("#content").innerHTML += data.text
            this.contentboxTarget.scrollTop = this.contentboxTarget.scrollHeight
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
