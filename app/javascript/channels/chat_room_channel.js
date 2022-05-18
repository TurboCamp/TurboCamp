import consumer from "./consumer"

let url = window.location.href 
let room_id = parseInt(url.substring(url.search("chat_rooms/") + 11))
if (url.indexOf("chat_rooms/") != -1 ){
  consumer.subscriptions.create({"channel":"ChatRoomChannel", "chat_room_id":room_id},{
    connected() {
    },
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
    received(data) {
      const message = `<div class="w-max ml-auto">
      <span class="text-xs block">${data.user}</span>
      <div class=" px-3 py-2 bg-gray-200 opacity-3 rounded-lg w-max">
      ${data.text} </div></div>`
      document.querySelector("#content").insertAdjacentHTML("beforeend" , message)

    }
  }
)
}
