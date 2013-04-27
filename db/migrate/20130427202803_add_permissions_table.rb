class AddPermissionsTable < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :network
      t.string :handle
      t.integer :event_id
      t.timestamps
    end
  end
end
