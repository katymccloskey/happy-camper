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

ActiveRecord::Schema.define(version: 20170818221613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campgrounds", force: :cascade do |t|
    t.string "name", limit: 75, null: false
    t.string "state", limit: 4, null: false
    t.string "contract_id", null: false
    t.string "facility_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "amps"
    t.string "pets"
    t.string "sewage"
    t.string "water"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_amenities", force: :cascade do |t|
    t.bigint "campground_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_cg_amenities_on_amenity_id"
    t.index ["campground_id"], name: "index_cg_amenities_on_campground_id"
  end

  create_table "details", force: :cascade do |t|
    t.string "description", null: false
    t.string "reservation_url"
    t.string "important_info"
    t.string "recreations"
    t.string "city", null: false
    t.string "state", null: false
    t.string "address"
    t.string "zip_code"
    t.string "contact"
    t.bigint "campground_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_details_on_campground_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campground_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_favorites_on_campground_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
