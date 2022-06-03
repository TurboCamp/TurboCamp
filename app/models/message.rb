# frozen_string_literal: true

class Message < ApplicationRecord
  include Visible
  include Slugable

  belongs_to :project
  has_many :comments, dependent: :destroy
  # belongs_to :project

  validates :title, presence: true
end
