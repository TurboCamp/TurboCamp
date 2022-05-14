class Comment < ApplicationRecord
  # belongs_to :message
  has_rich_text :content
  belongs_to :commentable, polymorphic: true
end
