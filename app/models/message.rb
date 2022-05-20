# frozen_string_literal: true

class Message < ApplicationRecord
  include Visible
  include Slugable 

  has_rich_text :content
  has_many :comments, as: :commentable, dependent: :destroy
  # belongs_to :project

  validates :title, presence: true
end
