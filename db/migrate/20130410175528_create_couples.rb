class CreateCouples < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.integer   "user_id"
      t.integer   "partner_id"

      

      t.timestamps
    end
  end
end
