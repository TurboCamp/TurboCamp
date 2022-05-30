class AddUserRelationsToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, foreign_key: true
    remove_column :comments, :commenter
    remove_column :comments, :avatar
    remove_column :comments, :image_data
  end
end
