class PrivateChat < ApplicationRecord
  belongs_to :project
  has_many :user_privates
  has_many :users , through: :user_privates , dependent: :destroy
  has_many :contents , as: :contentable , dependent: :destroy

  def self.find_or_create(users, project_id)
    users_ids = users.map(&:id).sort
    name = "Room:#{users_ids.join("-")}"
    if private_chat = self.where(roomname: name).first
      private_chat
    else
      private_chat = PrivateChat.new(roomname: name, project_id: project_id)
      private_chat.users = users
      private_chat.save
      private_chat
    end
  end

end
