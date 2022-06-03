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
      # render html: @content
    end
  end

  private

  def content_params
    params.require(:content).permit(:text, :image).merge(user: current_user)
  end
end
