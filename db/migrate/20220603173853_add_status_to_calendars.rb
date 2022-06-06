class AddStatusToCalendars < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :name, :string
  end
end
