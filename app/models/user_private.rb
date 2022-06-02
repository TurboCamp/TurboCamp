# frozen_string_literal: true

class UserPrivate < ApplicationRecord
  belongs_to :private_chat
  belongs_to :user
end
