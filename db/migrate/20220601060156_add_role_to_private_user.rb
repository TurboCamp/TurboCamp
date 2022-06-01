class AddRoleToPrivateUser < ActiveRecord::Migration[6.1]
  def change
    add_column :private_chats , :roomname , :string 
    #Ex:- add_index("admin_users", "username")
  end
end
