class AddContentToMessageAndComment < ActiveRecord::Migration[6.1]
  def change
    add_column :messages , :content , :text 
    add_column :comments , :content , :text 
  end
end
