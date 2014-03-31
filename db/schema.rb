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

ActiveRecord::Schema.define(version: 20140331113115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.integer  "client_id"
    t.integer  "stylist_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "user_input"
    t.integer  "stylii_rating"
  end

  create_table "clients", force: true do |t|
    t.string "name"
    t.string "photo_url"
    t.text   "notes"
    t.date   "birthdate"
    t.string "gender"
    t.string "phone_number"
    t.string "email"
    t.string "password_digest"
  end

  create_table "salons", force: true do |t|
    t.string "name"
    t.string "address"
    t.string "photo_url"
    t.string "phone_number"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "yelp_rating_image_url"
    t.float  "yelp_rating"
  end

  create_table "stylists", force: true do |t|
    t.integer "salon_id"
    t.string  "name"
    t.date    "birthdate"
    t.integer "male_price"
    t.integer "female_price"
    t.string  "specialty"
    t.string  "photo_url"
    t.integer "rating_average"
    t.time    "starts_work_at"
    t.time    "ends_work_at"
    t.string  "day_off"
  end

end
