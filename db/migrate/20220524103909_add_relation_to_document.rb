class AddRelationToDocument < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents , :bucket , foreign_key: true 
  end
end
