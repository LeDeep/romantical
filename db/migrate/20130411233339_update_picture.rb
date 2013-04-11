class UpdatePicture < ActiveRecord::Migration
  def up
    remove_column :pictures, :picture_file_name
    remove_column :pictures, :picture_file_size
    remove_column :pictures, :picture_content_type
    remove_column :pictures, :picture_updated_at
    add_attachment :pictures, :picture
  end

  def down
    add_column :pictures, :picture_file_name, :string
    add_column :pictures, :picture_file_size, :integer
    add_column :pictures, :picture_content_type, :string
    add_column :pictures, :picture_updated_at, :datetime
    remove_attachment :pictures, :picture
  end
end

