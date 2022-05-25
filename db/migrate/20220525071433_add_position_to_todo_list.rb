class AddPositionToTodoList < ActiveRecord::Migration[6.1]
    def change
      add_column :todo_lists, :position, :integer
      TodoList.order(:updated_at).each.with_index(1) do |tl, i|
      tl.update_column :position, i
      end
    end
end
