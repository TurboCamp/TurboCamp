class AddImageUrlToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :imageurl, :string
  end
end
