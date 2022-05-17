class RemoveColumnFromProject < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :member
    remove_column :projects, :useremail
    remove_column :projects, :role 
    remove_column :projects, :manage 
  end
end
