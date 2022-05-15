class Message < ApplicationRecord

  included Visible
  
  has_rich_text :content
  has_many :comments, as: :commentable

  validates :title, presence: true

end
