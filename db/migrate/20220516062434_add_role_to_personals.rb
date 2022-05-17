class AddRoleToPersonals < ActiveRecord::Migration[6.1]
  def change
    add_column :personals , :role , :string , default: 'teammate'
    remove_column :projects, :role
  end
end
