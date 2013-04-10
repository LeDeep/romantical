class RemovePointsFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :points
  end

  def down
    add_column :profiles, :points, :integer
  end
end
