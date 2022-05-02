class Message < ApplicationRecord
  include Visible
  
  has_many :comments
  has_rich_text :content

  validates :title, presence: true

end
