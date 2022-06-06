# frozen_string_literal: true

class PrivateChatsController < ApplicationController
  before_action :authenticate_user!
  layout 'chatroom'
  def show
    @other_user = User.find(params[:id])
    @users = [current_user, @other_user]
    @project = current_user.projects.friendly.find(params[:project_id])
    @private_chat = PrivateChat.find_or_create(@users, params[:project_id])
    @contents = @private_chat.contents
    @content = Content.new
    @user_private_chat = current_user.user_privates.find_by(private_chat: @private_chat)
    @enter_at = @user_private_chat&.enter_at || @private_chat.created_at
    @user_private_chat&.touch(:enter_at) 

    #更新如果當前使用者進入聊天室內可以更新未讀數量
    current_user.user_privates.find_by(private_chat:@private_chat).update(unread_count:0)
  end
end
