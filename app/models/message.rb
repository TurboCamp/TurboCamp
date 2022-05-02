class Message < ApplicationRecord
  include Visible
  
  has_many :comments, dependent: :destroy
  has_rich_text :content

  validates :title, presence: true

end
