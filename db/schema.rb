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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150709134743) do

  create_table "breaking_news", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "headlines", force: true do |t|
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "headlines", ["post_id"], name: "index_headlines_on_post_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["gallery_id"], name: "index_photos_on_gallery_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "photo"
    t.string   "video"
    t.integer  "view_count",  default: 0
    t.integer  "category_id"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["division_id"], name: "index_posts_on_division_id", using: :btree

  create_table "slider_news", force: true do |t|
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slider_news", ["post_id"], name: "index_slider_news_on_post_id", using: :btree

  create_table "special_news", force: true do |t|
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "special_news", ["post_id"], name: "index_special_news_on_post_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
