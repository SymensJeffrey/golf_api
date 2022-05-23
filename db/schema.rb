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

ActiveRecord::Schema.define(version: 2022_05_23_230737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "hole1_par"
    t.integer "hole2_par"
    t.integer "hole3_par"
    t.integer "hole4_par"
    t.integer "hole5_par"
    t.integer "hole6_par"
    t.integer "hole7_par"
    t.integer "hole8_par"
    t.integer "hole9_par"
    t.integer "front_par"
    t.integer "hole10_par"
    t.integer "hole11_par"
    t.integer "hole12_par"
    t.integer "hole13_par"
    t.integer "hole14_par"
    t.integer "hole15_par"
    t.integer "hole16_par"
    t.integer "hole17_par"
    t.integer "hole18_par"
    t.integer "back_par"
    t.integer "total_par"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "user_id"
    t.string "status"
    t.integer "hole1"
    t.integer "hole2"
    t.integer "hole3"
    t.integer "hole4"
    t.integer "hole5"
    t.integer "hole6"
    t.integer "hole7"
    t.integer "hole8"
    t.integer "hole9"
    t.integer "front"
    t.integer "hole10"
    t.integer "hole11"
    t.integer "hole12"
    t.integer "hole13"
    t.integer "hole14"
    t.integer "hole15"
    t.integer "hole16"
    t.integer "hole17"
    t.integer "hole18"
    t.integer "back"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.integer "tournament_id"
    t.string "name"
    t.integer "course_id"
    t.string "to_par"
    t.string "through"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.integer "user_id"
    t.string "date"
    t.integer "course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

end
