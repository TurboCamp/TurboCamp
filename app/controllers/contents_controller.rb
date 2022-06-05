# frozen_string_literal: true

class ContentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @project = current_user.projects.friendly.find(params[:project_id])

    if params[:private_chat_id]
      @chat_room = @project.private_chats.find(params[:private_chat_id])
      @content = @chat_room.contents.new(content_params)
      chat_room_id = params[:private_chat_id]
      private_or_not = true
 
    else
      @chat_room = @project.chat_room
      @content = @chat_room.contents.new(content_params)
      chat_room_id = @chat_room.id
      private_or_not = false
    end
    
    if @content.save
      SendMessageJob.perform_later(@content, chat_room_id, private_or_not)
      #更新他人的未讀量，因為其他人沒進房間不會執行程式碼，所以須更新他人而不是自己
      @project.private_chats.each do |room|
        user_id = (room.roomname.split('Room:').last.split('-') - ["#{current_user.id}"]).first
        unread_count = room.contents.where("created_at > ? AND user_id != ?", room.user_privates.find_by(user_id: user_id).enter_at , user_id).count
        User.find(user_id).user_privates.where(private_chat_id:room.id).update(unread_count:unread_count)
      end
    end
  end

  private

  def content_params
    params.require(:content).permit(:text, :image).merge(user: current_user)
  end
end
