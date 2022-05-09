class CreateChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
