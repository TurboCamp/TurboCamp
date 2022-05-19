# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
      @project = current_user.projects.friendly.find(params[:project_id])
      @chat_room = @project.chat_room
      @contents = @chat_room.contents
      @content = Content.new
  end
end
