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

ActiveRecord::Schema[7.1].define(version: 2025_04_22_165200) do
  create_table "evaluations", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "student_id", null: false
    t.integer "clarity"
    t.integer "organization"
    t.integer "technical"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "presenter_id"
    t.index ["event_id"], name: "index_evaluations_on_event_id"
    t.index ["student_id"], name: "index_evaluations_on_student_id"
  end

  create_table "event_presenters", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.string "grade"
    t.index ["event_id"], name: "index_event_presenters_on_event_id"
    t.index ["user_id"], name: "index_event_presenters_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "presenter_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "event_id", null: false
    t.string "presenter_name"
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.index ["event_id"], name: "index_feedbacks_on_event_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "name"
    t.string "grade"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "evaluations", "events"
  add_foreign_key "evaluations", "users", column: "student_id"
  add_foreign_key "event_presenters", "events"
  add_foreign_key "event_presenters", "users"
  add_foreign_key "feedbacks", "events"
  add_foreign_key "posts", "users"
end
