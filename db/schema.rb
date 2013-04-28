# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130427202935) do

  create_table "contents", :force => true do |t|
    t.string   "content_type"
    t.string   "twitter_content_id"
    t.string   "twitter_created_at"
    t.string   "twitter_body"
    t.string   "twitter_user_id"
    t.string   "twitter_user_name"
    t.string   "twitter_screen_name"
    t.string   "twitter_profile_image_url"
    t.string   "twitter_media_id"
    t.string   "twitter_media_url"
    t.string   "twitter_media_upload"
    t.integer  "event_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_view_public", :default => true
    t.boolean  "is_post_public", :default => true
    t.integer  "user_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "filters", :force => true do |t|
    t.string   "network"
    t.string   "tag"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string   "network"
    t.string   "handle"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
