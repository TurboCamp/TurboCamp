class AddStatusToTodolists < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_lists, :status, :string
    add_column :todo_lists, :position, :integer
    add_column :todo_lists, :start, :datetime
  end
end
