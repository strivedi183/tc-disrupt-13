class AddEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :is_view_public, :default => true
      t.boolean :is_post_public, :default => true
      t.integer :user_id
      t.timestamps
    end
  end
end
