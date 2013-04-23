class DropPictures < ActiveRecord::Migration
  def change
  	drop_table :pictures 
  	remove_column :users, :picture_id
  	remove_column :profiles, :picture_id
  end
end
