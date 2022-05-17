class AddRole < ActiveRecord::Migration[6.1]
  def change
    add_column :projects , :role , :string , default: 'teammate'
  end
end
