class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :nickname
      t.string :member
      t.string :useremail
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
