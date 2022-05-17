class AddImageUrlToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users , :imageurl, :string 
  end
end
