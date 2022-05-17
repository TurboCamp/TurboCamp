# frozen_string_literal: true

class Message < ApplicationRecord
  included Visible

  has_rich_text :content, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :project

  validates :title, presence: true
end
