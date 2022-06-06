# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  layout 'chatroom'

  def show
    @project = current_user.projects.friendly.find(params[:project_id])
    @chat_room = @project.chat_room
    @contents = @chat_room.contents
    @content = Content.new
    @user_chat = current_user.chat_users.find_by(chat_room:@chat_room)
    @enter_at = @user_chat&.enter_at || @chat_room.created_at
    @user_chat&.touch(:enter_at)

    current_user.chat_users.where(chat_room_id:@chat_room.id).update(unread_count:0)
  end
end
