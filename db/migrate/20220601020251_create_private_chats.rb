class CreatePrivateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :private_chats do |t|
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
