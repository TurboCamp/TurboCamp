class ChatRoom < ApplicationRecord
  belongs_to :project
  has_many :contents ,dependent: :destroy
end
