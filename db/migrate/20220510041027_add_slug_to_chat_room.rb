class AddSlugToChatRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_rooms , :slug , :string
  end
end
