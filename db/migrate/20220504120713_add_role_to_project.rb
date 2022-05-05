class AddRoleToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects , :manage , :string , default: "teammate"
  end
end
