class Comment < ApplicationRecord
  include Visible

  belongs_to :message
  has_rich_text :content
end
