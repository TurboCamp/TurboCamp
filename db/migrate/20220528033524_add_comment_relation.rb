class AddCommentRelation < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments , :message , foreign_key: true
    remove_column :comments, :commentable_type
    remove_column :comments, :commentable_id
  end
end
