class MoveRelationStatusColumn < ActiveRecord::Migration
  def up
    remove_column :profiles, :relationship_status
    add_column :couples, :relationship_status, :string
  end

  def down
    add_column :profiles, :relationship_status, :string
    remove_column :couples, :relationship_status
  end
end
