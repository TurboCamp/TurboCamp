# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    @comment = @message.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_back fallback_location: root_path
    else
      render :edit
    end
  end

  def destroy
    @comment = @message.comments.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: root_path
  end

  private

  def set_message
    @project = current_user.projects.friendly.find(params[:project_id])
    @message = @project.messages.friendly.find(params[:message_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
