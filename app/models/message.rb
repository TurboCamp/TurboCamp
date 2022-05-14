class Message < ApplicationRecord
  # include Visible
  has_rich_text :content

  validates :title, presence: true
  has_many :comments, as: :commentable

end
