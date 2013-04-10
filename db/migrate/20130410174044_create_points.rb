class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer   "user_id"
      t.string    "activity"
      t.integer   "partner_id"
      t.integer   "activty_value"
      

      t.timestamps
    end
  end
end