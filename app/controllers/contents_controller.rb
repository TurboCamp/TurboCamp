# frozen_string_literal: true

class ContentsController < ApplicationController
  def create
    @project = Project.friendly.find(params[:project_id])
    @chat_room = @project.chat_room
    @content = @chat_room.contents.new(content_params)
    # render html:params
    ActionCable.server.broadcast(@content.chat_room, @content) if @content.save
  end

  private

  def content_params
    params.require(:content).permit(:text ).merge(user:current_user.nickname)
  end
end
