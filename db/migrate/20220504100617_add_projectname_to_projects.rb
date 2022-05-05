class AddProjectnameToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects , :title , :string 
    add_column :projects , :description , :text
    add_column :projects , :role , :string , default:"user"

  end
end
