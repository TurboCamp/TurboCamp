class AddUserRelationToContent < ActiveRecord::Migration[6.1]
  def change
    add_reference :contents , :user , foreign_key: true 
    remove_column :contents, :user
    end
end
