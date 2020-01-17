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

ActiveRecord::Schema.define(version: 20200117180846) do

  create_table "code_things", force: :cascade do |t|
    t.integer "code_id"
    t.integer "thing_id"
    t.integer "round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_code_things_on_code_id"
    t.index ["thing_id"], name: "index_code_things_on_thing_id"
  end

  create_table "code_users", force: :cascade do |t|
    t.integer "code_id"
    t.integer "user_id"
    t.integer "score"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_code_users_on_code_id"
    t.index ["user_id"], name: "index_code_users_on_user_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "gamecodes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gamecodes", force: :cascade do |t|
    t.string "codes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "round"
    t.text "submission"
    t.integer "user_id"
    t.boolean "guessed_correctly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guesser_id"
    t.integer "code_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "things", force: :cascade do |t|
    t.text "thing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin"
    t.boolean "player"
    t.string "game_code"
    t.integer "score"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
