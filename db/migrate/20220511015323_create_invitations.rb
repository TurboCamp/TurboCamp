class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.string :invite_project_id
      t.string :email
      t.string :token
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
