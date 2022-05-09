import consumer from "./consumer"

let url = window.location.href 
let room_id = parseInt(url.substring(url.search("chat_rooms/") + 11))
console.log(room_id)
if (url.indexOf("chat_rooms/") != -1 ){
  console.log(123);
  consumer.subscriptions.create({"channel":"ChatRoomChannel", "chat_room_id":room_id},{
    connected() {
      console.log(`connect to ${room_id}`)
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      document.querySelector("#content").insertAdjacentHTML("beforeend" , data.text)

    }
  }
)
}
