# frozen_string_literal: true

module Buckets
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @commentable = Bucket.find(params[:bucket_id])
    end
  end
end
