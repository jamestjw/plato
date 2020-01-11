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

ActiveRecord::Schema.define(version: 2020_01_11_034355) do

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer "board_id", null: false
    t.string "title"
    t.text "description"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_cards_on_board_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organisations_users", id: false, force: :cascade do |t|
    t.integer "organisation_id", null: false
    t.integer "user_id", null: false
    t.index ["organisation_id"], name: "index_organisations_users_on_organisation_id"
    t.index ["user_id"], name: "index_organisations_users_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "no_of_users", default: 1, null: false
    t.boolean "unlimited_boards", default: false, null: false
    t.boolean "active", default: true, null: false
    t.integer "plan_type", null: false
    t.float "monthly_price", null: false
    t.float "annual_price", null: false
    t.float "additional_user_price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "card_id", null: false
    t.string "detail"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_tasks_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "organisation_owner", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "boards"
  add_foreign_key "tasks", "cards"
end
