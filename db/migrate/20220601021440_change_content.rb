class ChangeContent < ActiveRecord::Migration[6.1]
  def change
    remove_column :contents, :chat_room_id 
    add_reference :contents , :contentable , polymorphic: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
