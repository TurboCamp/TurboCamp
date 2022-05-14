class AddStatusToBuckets < ActiveRecord::Migration[6.1]
  def change
    add_column :buckets, :status, :string
  end
end
