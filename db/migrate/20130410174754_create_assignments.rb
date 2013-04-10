class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer   "couple_id"
      t.integer   "activity_id"
      t.integer   "points"
      

      t.timestamps
    end
  end
end