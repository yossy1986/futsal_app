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

ActiveRecord::Schema.define(version: 2018_09_23_222620) do

  create_table "apply_matches", force: :cascade do |t|
    t.integer "team_info_id"
    t.integer "match_req_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_links", force: :cascade do |t|
    t.integer "match_req_id"
    t.integer "receive_team_id"
    t.integer "request_team_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer "chat_link_id"
    t.integer "team_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "pref"
    t.string "address"
    t.string "tel"
    t.string "site"
    t.text "open_hour"
    t.text "fee"
    t.string "parking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_reqs", force: :cascade do |t|
    t.integer "team_info_id"
    t.datetime "match_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "pref"
    t.integer "facility"
    t.integer "req_cat"
    t.integer "req_rank"
    t.integer "req_team_num"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_infos", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "image"
    t.integer "pref"
    t.integer "facility"
    t.integer "cat"
    t.integer "rank"
    t.integer "age_ave"
    t.text "comment"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_levels", force: :cascade do |t|
    t.integer "team_info_id"
    t.integer "level_name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attack"
    t.integer "physical"
    t.integer "stamina"
    t.integer "defense"
    t.integer "tactics"
    t.integer "technique"
  end

end
