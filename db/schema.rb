# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_27_122947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "challenges", force: :cascade do |t|
    t.string "status"
    t.bigint "challenged_club_id"
    t.bigint "challenging_club_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenged_club_id"], name: "index_challenges_on_challenged_club_id"
    t.index ["challenging_club_id"], name: "index_challenges_on_challenging_club_id"
  end

  create_table "club_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "club_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_club_requests_on_club_id"
    t.index ["user_id"], name: "index_club_requests_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "creators", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_creators_on_user_id"
  end

  create_table "match_users", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "user_id", null: false
    t.string "team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_match_users_on_match_id"
    t.index ["user_id"], name: "index_match_users_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "location"
    t.datetime "start_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "max_players"
    t.bigint "user_id"
    t.boolean "private_match", default: false
    t.bigint "challenge_id"
    t.index ["challenge_id"], name: "index_matches_on_challenge_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.datetime "start_at"
    t.integer "amount_of_teams"
    t.integer "amount_of_ko"
    t.string "description"
    t.string "name"
    t.string "rules"
    t.integer "age_group"
    t.string "skill_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id", null: false
    t.index ["creator_id"], name: "index_tournaments_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "position"
    t.date "birthday"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "club_requests", "clubs"
  add_foreign_key "club_requests", "users"
  add_foreign_key "clubs", "users"
  add_foreign_key "creators", "users"
  add_foreign_key "match_users", "matches"
  add_foreign_key "match_users", "users"
  add_foreign_key "matches", "challenges"
  add_foreign_key "matches", "users"
  add_foreign_key "tournaments", "creators"
end
