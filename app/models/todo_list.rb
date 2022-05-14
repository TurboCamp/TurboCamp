class TodoList < ApplicationRecord
    has_many :todo_items
    # accepts_nested_attributes_for :todo_items, reject_if: :all_blank, allow_destroy: true

    def percent_complete
    return 0 if total_items == 0
    ( 100 * completed_items.to_f / total_items).round(1)
    end

    def completed_items
    @completed_items ||= todo_items.completed.count
    end

    def total_items
    @total_items ||= todo_items.count
    end
end
