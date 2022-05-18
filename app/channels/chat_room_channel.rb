# frozen_string_literal: true

class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ChatRoomChannel_#{params[:chat_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
