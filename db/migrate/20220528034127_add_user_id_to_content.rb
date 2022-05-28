class AddUserIdToContent < ActiveRecord::Migration[6.1]
  def change
    add_column :contents , :avatar , :text
  end
end
