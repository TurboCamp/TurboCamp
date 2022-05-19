# frozen_string_literal: true

class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy

  def percent_complete
    return 0 if total_items.zero?

    (100 * completed_items.to_f / total_items).round(1)
  end

  def completed_items
    @completed_items ||= todo_items.completed.count
  end

  def total_items
    @total_items ||= todo_items.count
  end
end
