# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    @comment.update(commenter:current_user.nickname)
    redirect_to polymorphic_path([@project , @commentable])

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
