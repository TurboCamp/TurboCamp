class ChangeProjectTime < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :created_at, :datetime, precision: 3
    change_column :projects, :updated_at, :datetime, precision: 3
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
