# frozen_string_literal: true

class ContentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @project = current_user.projects.friendly.find(params[:project_id])
    @chat_room = @project.chat_room
    @content = @chat_room.contents.new(content_params)
    @content.user = current_user
    @content.save
    
    SendMessageJob.perform_later(@content , @chat_room)
  end

  private

  def content_params
    params.require(:content).permit(:text , :image)
  end
end
