// import consumer from "../channels/consumer"
// import {}

// let url = window.location.href 
// let room_id = parseInt(url.substring(url.search("chat_rooms/") + 11))
// if (url.indexOf("chat_rooms/") != -1 ){
//   consumer.subscriptions.create({"channel":"ChatRoomChannel", "chat_room_id":room_id},{
//     connected() {
//     },
//     disconnected() {
//       // Called when the subscription has been terminated by the server
//     },
//     received(data) {
//       const message = `<div class="w-max ml-auto">
//       <span class="text-xs block">${data.user}</span>
//       <div class=" px-3 py-2 bg-gray-200 opacity-3 rounded-lg w-max">
//       ${data.text} </div></div>`
//       document.querySelector("#content").insertAdjacentHTML("beforeend" , message)

//     }
//   }
// )
// }

import consumer from '../channels/consumer'
import { Controller } from 'stimulus'
export default class extends Controller {
  static targets = ['contentbox']
  connect() {
    this.contentboxTarget.scrollTop = this.contentboxTarget.scrollHeight
    if (this.contentboxTarget) {
      const chat_room_id = this.element.dataset.ChatId
      consumer.subscriptions.create(
        { 'channel': 'ChatRoomChannel', 'chat_room_id': chat_room_id },
        {
          // 接收廣播的資訊讓所有訂閱者能夠同時收到資訊且更改
          received(data) {
           console.log(data)
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