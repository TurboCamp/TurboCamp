class AddRalateTo < ActiveRecord::Migration[6.1]
  def change
    add_reference :todo_lists , :project , foreign_key: true
  end
end
