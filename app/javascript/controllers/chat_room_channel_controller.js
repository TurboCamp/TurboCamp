import { createConsumer } from '@rails/actioncable'
// import consumer from '../channels/consumer'
import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['contentbox' , 'textarea' , 'file_upload' , 'message_input' , 'submit_btn']
  initialize() {
    const content = document.querySelector("#content")
    content.scrollTo(0 , content.scrollHeight)
    if (this.contentboxTarget) {
      const chat_room_id = this.element.dataset.id
      createConsumer().subscriptions.create(
        { "channel": "ChatRoomChannel", "chat_room_id": chat_room_id },{ 
          connected(){
            console.log("connected....");
            
          },
          received(data) {
            console.log(data);
            content.innerHTML += data.textcontain
            document.querySelector("#content_text").value = ""
            document.querySelector("input[type='submit']").disabled = false
            document.querySelector("#content_image").value = ''          
            content.scrollTo(0 , content.scrollHeight)
          },
        }
      )
    }
  }
}
