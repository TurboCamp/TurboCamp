class CreateChatUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_users do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :chat_room, null: false, foreign_key: true
      t.datetime :enter_at
      t.integer :unread_count , default: 0

      t.timestamps
    end
  end
end
