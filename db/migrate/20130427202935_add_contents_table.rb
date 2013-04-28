class AddContentsTable < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :content_type
      t.string :twitter_content_id
      t.string :twitter_created_at
      t.string :twitter_body
      t.string :twitter_user_id
      t.string :twitter_user_name
      t.string :twitter_screen_name
      t.string :twitter_profile_image_url
      t.string :twitter_media_id
      t.string :twitter_media_url
      t.string :twitter_media_upload
      t.integer :event_id
      t.timestamps
    end
  end
end
