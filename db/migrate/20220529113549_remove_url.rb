class RemoveUrl < ActiveRecord::Migration[6.1]
  def change
    change_column :users , :imageurl ,:string ,default:"default_user"
  end
end
