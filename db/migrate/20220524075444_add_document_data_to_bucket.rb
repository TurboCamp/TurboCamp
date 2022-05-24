class AddDocumentDataToBucket < ActiveRecord::Migration[6.1]
  def change
    add_column :buckets , :document_data , :text
  end
end
