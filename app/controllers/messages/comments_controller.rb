# frozen_string_literal: true

module Messages
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @project = current_user.projects.friendly.find(params[:project_id])
      @commentable = @project.messages.friendly.find(params[:message_id])
    end
  end
end
