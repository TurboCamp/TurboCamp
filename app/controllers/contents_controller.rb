# frozen_string_literal: true

class ContentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @project = current_user.projects.friendly.find(params[:project_id])
    @chat_room = @project.chat_room
    @content = @chat_room.contents.new(content_params)
    @content.user = current_user
    if @content.save
      ActionCable.server.broadcast "ChatRoomChannel_#{@chat_room.id}" , { send_by:@content.user.nickname , message: @content.text , image: @content.image_url, avatar: @content.user.avatar_url || @content.user.imageurl , time: @content.created_at.to_s(:message_at) }
     
    end
  end

  private

  def content_params
    params.require(:content).permit(:text , :image)
  end
end
