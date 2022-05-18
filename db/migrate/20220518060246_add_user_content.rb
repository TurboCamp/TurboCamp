class AddUserContent < ActiveRecord::Migration[6.1]
  def change
    add_column :contents , :user , :string 
  end
end
