# frozen_string_literal: true

class TodoItemReflex < ApplicationReflex
  def todo_complete
    todo_item = TodoItem.find(element.dataset.id)
    todo_item.update(completed: true, completed_at: Time.now)
  end

  def todo_incomplete
    todo_item = TodoItem.find(element.dataset.id)
    todo_item.update(completed: false, completed_at: nil)
  end
end
