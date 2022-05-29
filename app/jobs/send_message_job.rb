class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(content , chat_room)
    text = ApplicationController.render( 
      partial: "chat_rooms/message" ,
      locals: {content: content})
    ActionCable.server.broadcast "ChatRoomChannel_#{chat_room.id}" , {text: text}
  end
end
