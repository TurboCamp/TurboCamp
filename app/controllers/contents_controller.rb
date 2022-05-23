# frozen_string_literal: true

class ContentsController < ApplicationController
  def create
    @project = Project.friendly.find(params[:project_id])
    @chat_room = @project.chat_room
    @content = @chat_room.contents.new(content_params)
    if @content.save
      ActionCable.server.broadcast "ChatRoomChannel_#{@chat_room.id}" , { send_by:@content.user,message: @content.text , image: @content.image_url}
    end
  end

  private

  def content_params
    params.require(:content).permit(:text , :image).merge(user:current_user.nickname)
  end
end
