class CreateCompensations < ActiveRecord::Migration
  def change
    create_table :compensations do |t|
      t.integer   "user_id"
      t.integer   "activity_id"
      t.integer   "points"
      t.date      "expiration"
      

      t.timestamps
    end
  end
end