class Updateprofilestable < ActiveRecord::Migration
	def change
		add_column :profiles, :first_name, :string
		add_column :profiles, :last_name, :string
		remove_column :profiles, :name
	end
end
