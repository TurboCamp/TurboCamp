class AddUserIdToContent < ActiveRecord::Migration[6.1]
  def change
    add_column :contents , :avatar , :text , default: "default_user"
  end
end
