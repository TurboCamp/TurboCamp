# frozen_string_literal: true

module Messages
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @commentable = Message.find(params[:message_id])
    end
  end
end
