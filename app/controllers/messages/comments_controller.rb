class Messages::CommentsController < CommentsController
  before_action :set_commentable

  private
    def set_commentable
      @commentable = Message.find(params[:message_id])
    end
end