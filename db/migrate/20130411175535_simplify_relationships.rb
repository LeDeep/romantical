class SimplifyRelationships < ActiveRecord::Migration
  def up
    drop_table :points
    drop_table :activities

    remove_column :users, :couple_id
    remove_column :users, :partner_id

    add_column :profiles, :couple_id, :integer

    rename_column :couples, :relationship_status, :status
 
    remove_column :assignments, :activity_id
    add_column :assignments, :activity, :string
    add_column :assignments, :validity_period, :integer

    rename_column :compensations, :expiration, :date_of_occurrence
    rename_column :compensations, :activity_id, :assignment_id
    rename_column :compensations, :user_id, :profile_id
  end

  def down
    add_column :users, :couple_id, :integer
    add_column :users, :partner_id, :integer
    
    remove_column :profiles, :couple_id
    
    rename_column :couples, :status, :relationship_status

    add_column :assignments, :activity_id, :integer
    remove_column :assignments, :activity
    remove_column :assignments, :validity_period

    rename_column :compensations, :date_of_occurrence, :expiration
    rename_column :compensations, :assignment_id, :activity_id
    rename_column :compensations, :profile_id, :user_id

    create_table :points do |t|
      t.integer  "user_id"
      t.string   "activity"
      t.integer  "partner_id"
      t.integer  "activty_value"

      t.timestamps
    end

    create_table :activities do |t|
      t.string   "name"

      t.timestamps
    end
  end
end
