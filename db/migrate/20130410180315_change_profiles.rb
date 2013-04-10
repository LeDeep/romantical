class ChangeProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :anniversary
    remove_column :profiles, :age
    remove_column :profiles, :in_relationship_with
    add_column :couples, :anniversary, :date
    add_column :profiles, :birthdate, :date
  end

  def down
    remove_column :couples, :anniversary
    remove_column :profiles, :birthdate
    add_column :profiles, :anniversary, :date
    add_column :profiles, :age, :integer
    add_column :profiles, :in_relationship_with, :string

  end
end
