import { createConsumer } from '@rails/actioncable'
// import consumer from '../channels/consumer'
import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['contentbox' , 'textarea' , 'file_upload' , 'message_input' , 'submit_btn']
  initialize() {
    const content = document.querySelector("#content")
    content.scrollTo(0 , content.scrollHeight)
    if (this.hasContentboxTarget) {
      const chat_room_id = this.element.dataset.roomId 
      const private_chat_id = this.element.dataset.privateId

      createConsumer().subscriptions.create(
        { "channel": "ChatRoomChannel", chatRoomId: chat_room_id  , privateChatId: private_chat_id},{ 
          connected(){
            console.log(`connect: private-${private_chat_id}`);
            console.log(`connect: chat-${chat_room_id }`);
            
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
