class AddPictureid < ActiveRecord::Migration
  def up
    add_column :users, :picture_id, :integer
    add_column :profiles, :picture_id, :integer
  end

  def down
    remove_column :users, :picture_id
    remove_column :profiles, :picture_id
  end
end
