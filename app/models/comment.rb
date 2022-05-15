class Comment < ApplicationRecord
  has_rich_text :content
  belongs_to :commentable, polymorphic: true
end
