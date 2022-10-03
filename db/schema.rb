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

ActiveRecord::Schema[7.0].define(version: 2022_10_02_220417) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "invitation_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hesis", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "students", "advisors"
  add_foreign_key "students", "programs"
end
