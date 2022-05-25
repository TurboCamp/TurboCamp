# frozen_string_literal: true

class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :location, presence: true
  belongs_to :project
end
