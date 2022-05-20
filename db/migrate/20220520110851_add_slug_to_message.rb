class AddSlugToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages , :slug , :string
  end
end
