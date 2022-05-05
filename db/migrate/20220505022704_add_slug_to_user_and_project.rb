class AddSlugToUserAndProject < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
    add_column :projects, :slug, :string
    add_index :projects, :slug, unique: true
  end
end
