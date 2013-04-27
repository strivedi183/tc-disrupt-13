class AddFiltersTable < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :network
      t.string :tag
      t.integer :event_id
      t.timestamps
    end
  end
end
