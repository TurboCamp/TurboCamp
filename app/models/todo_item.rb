# frozen_string_literal: true

class TodoItem < ApplicationRecord
  belongs_to :todo_list

  scope :completed, lambda {
    where(completed: true)
  }

  validates :description, presence: true
end
