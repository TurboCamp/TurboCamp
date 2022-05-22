class AddImageDataToChatRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :contents , :image_data , :text
  end
end
