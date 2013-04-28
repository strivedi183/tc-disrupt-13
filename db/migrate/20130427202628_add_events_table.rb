class AddEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :latitude, :default => 0
      t.float :longitude, :default => 0
      t.string :instagram_location_id
      t.boolean :is_view_public, :default => true
      t.boolean :is_post_public, :default => true
      t.integer :user_id
      t.timestamps
    end
  end
end
