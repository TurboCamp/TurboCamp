# frozen_string_literal: true

class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(content, chat_room_id, is_Private)
    @room = if is_Private
              PrivateChat.find_by(id: chat_room_id)
            else
              ChatRoom.find_by(id: chat_room_id)
            end
    textcontain = ApplicationController.render(
      partial: 'chat_rooms/content',
      locals: { content: }
    )
    ChatRoomChannel.broadcast_to @room, { textcontain: }
  end
end
