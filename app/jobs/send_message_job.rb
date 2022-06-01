class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(content , chat_room_id , is_Private)
    if is_Private 
      @room = PrivateChat.find_by(id: chat_room_id)
    else
      @room = ChatRoom.find_by(id: chat_room_id)
    end
    textcontain = ApplicationController.render( 
      partial:'chat_rooms/content' ,
      locals: {content: content})
      ChatRoomChannel.broadcast_to @room,{textcontain:textcontain}
  end
end
