class UpdateProfiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :anniversery, :anniversary
  end
end
