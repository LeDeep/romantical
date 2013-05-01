class Removecolumnsfromuser < ActiveRecord::Migration
  def change
  	remove_column :users, :password_digest
  	remove_column :users, :oauth_token
  	remove_column :users, :oauth_expires_at
  end
end
