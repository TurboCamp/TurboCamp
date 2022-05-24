class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.text :document_data
      
      t.timestamps
    end
  end
end
