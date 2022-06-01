class PrivateChatsController < ApplicationController
  before_action :authenticate_user!

  def show 
    @project = current_user.projects.friendly.find(params[:project_id])
    @users = [current_user , User.find(params[:id])]
    @private_chat = @project.private_chats.find(params[:id])
    @contents = @private_chat.contents
    @content = Content.new
  end

end