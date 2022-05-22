# frozen_string_literal: true

class Content < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :chat_room
end
