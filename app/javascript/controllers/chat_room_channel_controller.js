
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
            console.log(data);
            const image = `
            <div class="chat_room" data-chat-room-channel-target="textarea">
              <div class="avatar">
                <img src="${data.avatar} , size:'20x20' , class='w-full h-full' %>
              </div>
              <div class="content_box">
                <span class="speaker">${data.send_by}</span>
              </div>
              <div class="content_text">
            ${data.message}<a href="${data.image}"><img src="${data.image}" width="150" height="150"></a></div></div>`

            const message = `
            <div class="chat_room"  data-chat-room-channel-target="textarea">
              <div class="avatar">
                <img src="${data.avatar}" , size='20x20' , class='w-full h-full'>
              </div>
              <div class="content_box">
                <span class="speaker">${data.send_by}</span>
                <div class="content_text">${data.message}
              </div>
            </div>
            </div>`
            
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
