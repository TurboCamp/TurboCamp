# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    redirect_to @commentable, notice: '留言成功'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
