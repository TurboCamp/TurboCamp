# frozen_string_literal: true

class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    if params[:private_chat_id] != 0
      room = PrivateChat.find(params[:private_chat_id])
    elsif params[:chat_room_id] != 0
      room = ChatRoom.find(params[:chat_room_id])
    end

    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
