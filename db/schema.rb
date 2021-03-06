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

ActiveRecord::Schema.define(version: 20170825041512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gears", force: :cascade do |t|
    t.string   "name"
    t.integer  "total_distance_in_meters"
    t.integer  "total_time_in_seconds"
    t.string   "last_search_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "users_id"
    t.string   "strava_gear_id"
    t.index ["users_id"], name: "index_gears_on_users_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "strava_id"
    t.string   "access_token"
    t.string   "strava_username"
    t.boolean  "premium_user"
    t.integer  "num_of_followers"
    t.integer  "friend_count"
    t.string   "date_format"
    t.string   "measure_format"
  end

  add_foreign_key "gears", "users", column: "users_id"
end
