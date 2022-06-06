# frozen_string_literal: true

class ChatRoom < ApplicationRecord
  belongs_to :project
  has_many :contents, as: :contentable, dependent: :destroy
  has_many :chat_users 
  has_many :users , through: :chat_users , dependent: :destroy

end
