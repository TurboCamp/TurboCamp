class AddCountToPrivate < ActiveRecord::Migration[6.1]
  def change
    add_column :user_privates , :unread_count , :integer , default: 0
  end
end
