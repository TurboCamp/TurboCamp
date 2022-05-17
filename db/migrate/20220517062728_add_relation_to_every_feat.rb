class AddRelationToEveryFeat < ActiveRecord::Migration[6.1]
  def change
    add_reference :buckets , :project, foreign_key: true
    add_reference :messages , :project , foreign_key: true
    add_reference :schedules , :project , foreign_key: true
  end
end
