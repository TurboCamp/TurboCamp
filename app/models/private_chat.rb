# frozen_string_literal: true

class PrivateChat < ApplicationRecord
  belongs_to :project
  has_many :user_privates
  has_many :users, through: :user_privates, dependent: :destroy
  has_many :contents, as: :contentable, dependent: :destroy

  def self.find_or_create(users, project_id)
    users_ids = users.map(&:id).sort
    name = "Room:#{users_ids.join('-')}"
    if private_chat = where(roomname: name).first
    else
      private_chat = PrivateChat.new(roomname: name, project_id:)
      private_chat.users = users
      private_chat.save
    end
    private_chat
  end
end
