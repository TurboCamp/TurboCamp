import consumer from "./consumer"

let url = window.location.href 
let room_id = parseInt(url.substring(url.search("chat_rooms/") + 11))
if (url.indexOf("chat_rooms/") != -1 ){
  consumer.subscriptions.create({"channel":"ChatRoomChannel", "chat_room_id":room_id},{
    connected() {
      console.log(`connect to ${room_id}`)
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data);
      

      const ii = `<li>${data.text}</li>`
      document.querySelector("#content").insertAdjacentHTML("beforeend" , ii)

    }
  }
)
}
