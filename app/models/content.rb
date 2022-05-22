# frozen_string_literal: true

class Content < ApplicationRecord
  include ImageUploader::Attachment(:image)
  validates :text , presence: true ,  unless: :image_data
  belongs_to :chat_room
end
