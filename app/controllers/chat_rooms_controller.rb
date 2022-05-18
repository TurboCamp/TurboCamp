# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    if user_signed_in?
      @project = Project.friendly.find(params[:project_id])
      @chat_room = @project.chat_room
      # render html: @project.title
      @contents = @chat_room.contents
      @content = Content.new
    else
      redirect_to root_path, notice: '請登入'
    end
  end
end
