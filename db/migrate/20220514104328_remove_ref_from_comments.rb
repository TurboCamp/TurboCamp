class RemoveRefFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_reference :comments, :message, foreign_key: true, index: true
  end
end
