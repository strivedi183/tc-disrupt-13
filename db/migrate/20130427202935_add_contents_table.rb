class AddContentsTable < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :body
      t.string :url
      t.string :content_type
      t.integer :event_id
      t.timestamps
    end
  end
end
