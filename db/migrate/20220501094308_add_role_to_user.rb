class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users , :role , :string , default: "user"
    add_column :users , :nickname , :string
  end
end
