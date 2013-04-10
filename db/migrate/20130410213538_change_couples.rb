class ChangeCouples < ActiveRecord::Migration
  def up
    remove_column :couples, :user_id
    remove_column :couples, :partner_id
    add_column :users, :couple_id, :integer
  end

  def down
    add_column :couples, :user_id, :integer
    add_column :couples, :partner_id, :integer
    remove_column :users, :couple_id
  end
end
