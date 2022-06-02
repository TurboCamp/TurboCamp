# frozen_string_literal: true

class Schedule < ApplicationRecord
  has_many :todo_lists

  validates :title, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :location, presence: true
  belongs_to :project
end
