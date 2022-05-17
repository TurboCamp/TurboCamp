# frozen_string_literal: true

class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    reject unless params[:chat_room_id]
    chat_room = ChatRoom.find(params[:chat_room_id].to_i)
    stream_for(chat_room)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
