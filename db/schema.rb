# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_08_192826) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "test_times", ["9:00am", "10:00am", "1:00pm", "4:00pm"]

  create_table "advisors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "invitation_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hesis", force: :cascade do |t|
    t.date "date"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_hesis_on_date"
    t.index ["time"], name: "index_hesis_on_time"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.integer "minimum_sle"
    t.integer "minimum_hesi"
    t.integer "minimum_hesi_section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "program_id", null: false
    t.integer "start_date", null: false
    t.bigint "advisor_id", null: false
    t.integer "sle", null: false
    t.string "phone", null: false
    t.integer "attempt_number", null: false
    t.date "hesi_date"
    t.integer "hesi_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_students_on_advisor_id"
    t.index ["program_id"], name: "index_students_on_program_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "students", "advisors"
  add_foreign_key "students", "programs"
end
