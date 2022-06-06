class ChangeEnterAtDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :chat_users , :enter_at ,:datetime , default:DateTime.now
    change_column :user_privates , :enter_at ,:datetime , default:DateTime.now
  end
end
