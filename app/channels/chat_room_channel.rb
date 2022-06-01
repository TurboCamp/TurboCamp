# frozen_string_literal: true

class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    if params[:privateChatId] 
      room = PrivateChat.find_by(id: params[:privateChatId])
    elsif params[:chatRoomId] 
      room = ChatRoom.find_by(id: params[:chatRoomId])
    end
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
