class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string    "name"
      t.integer   "points"
      t.string    "gender"
      t.string    "in_relationship_with"
      t.string    "relationship_status"
      t.datetime  "anniversery"
      t.integer   "age"
      t.string    "city"
      t.string    "state"
      t.integer   "user_id"

      t.timestamps
    end
  end
end
