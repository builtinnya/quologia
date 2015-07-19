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

ActiveRecord::Schema.define(version: 20150719015203) do

  create_table "quotes", force: :cascade do |t|
    t.integer  "poster_id",    limit: 4
    t.string   "author_name",  limit: 255,   null: false
    t.string   "content",      limit: 255,   null: false
    t.text     "author_image", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "source",       limit: 255
  end

  add_index "quotes", ["poster_id"], name: "index_quotes_on_poster_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",   limit: 255,   null: false
    t.string   "uid",        limit: 255,   null: false
    t.string   "nickname",   limit: 255
    t.string   "name",       limit: 255,   null: false
    t.text     "image_url",  limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

end
