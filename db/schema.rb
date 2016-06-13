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

ActiveRecord::Schema.define(version: 20160613193601) do

  create_table "carriages", force: :cascade do |t|
    t.integer  "number"
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "train_id"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "sitonly_seats"
  end

  add_index "carriages", ["id", "type"], name: "index_carriages_on_id_and_type"
  add_index "carriages", ["train_id"], name: "index_carriages_on_train_id"

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "routes", ["id"], name: "index_routes_on_id"

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations_routes", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "route_id"
    t.integer  "number",     default: 0
    t.integer  "position"
    t.datetime "departing"
    t.datetime "arrival"
  end

  add_index "stations_routes", ["station_id", "route_id"], name: "index_stations_routes_on_station_id_and_route_id", unique: true

  create_table "tickets", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "train_id"
    t.integer  "user_id"
    t.integer  "start_station_id"
    t.integer  "finish_station_id"
    t.string   "name"
    t.string   "surname"
  end

  add_index "tickets", ["finish_station_id"], name: "index_tickets_on_finish_station_id"
  add_index "tickets", ["start_station_id"], name: "index_tickets_on_start_station_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
    t.integer  "route_id"
    t.boolean  "head",       default: true
  end

  add_index "trains", ["route_id"], name: "index_trains_on_route_id"
  add_index "trains", ["station_id"], name: "index_trains_on_station_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wagons", force: :cascade do |t|
    t.string   "types"
    t.integer  "upper"
    t.integer  "lower"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "train_id"
  end

end
