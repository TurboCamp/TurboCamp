class AddUserIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :avatar, :text
  end
end
