class AddEnterAtToUserPrivate < ActiveRecord::Migration[6.1]
  def change
    add_column :user_privates , :enter_at  , :datetime 
  end
end
