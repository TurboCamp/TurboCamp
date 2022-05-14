class TodoItem < ApplicationRecord
  belongs_to :todo_list
  

  scope :completed, -> do
    where(completed: true)
  end

  validates :description, presence: true
end
