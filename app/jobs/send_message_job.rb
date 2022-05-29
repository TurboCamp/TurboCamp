class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(content , chat_room)
    textcontain = ApplicationController.render( 
      partial:'chat_rooms/content' ,
      locals: {content: content})
    ActionCable.server.broadcast "ChatRoomChannel_#{chat_room.id}",{textcontain:textcontain}
  end
end
