class ChangeUserProjectsToPersonal < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_projects , :personals
  end
end
