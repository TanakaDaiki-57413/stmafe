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

ActiveRecord::Schema[8.1].define(version: 2026_08_10_094951) do
  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_admins_on_email_address", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "material_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["material_id"], name: "index_bookmarks_on_material_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "material_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "material_id", null: false
    t.integer "tag_id", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_material_tags_on_material_id"
    t.index ["tag_id"], name: "index_material_tags_on_tag_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "author", null: false
    t.float "average_level", default: 0.0, null: false
    t.string "body", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.string "isbn_number", null: false
    t.integer "price", null: false
    t.string "publisher", null: false
    t.date "release_date", null: false
    t.string "study_level", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_materials_on_category_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "is_read", default: false, null: false
    t.integer "notifiable_id", null: false
    t.string "notifiable_type", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "followed_id"
    t.integer "follower_id"
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "author", null: false
    t.datetime "created_at", null: false
    t.string "isbn_number", null: false
    t.integer "progress_status", default: 0, null: false
    t.string "publisher", null: false
    t.text "reply"
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.integer "material_id", null: false
    t.float "rate", null: false
    t.integer "study_time", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["material_id"], name: "index_reviews_on_material_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id"
    t.index ["admin_id"], name: "index_sessions_on_admin_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "active_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.text "introduction", null: false
    t.string "nickname", null: false
    t.string "password_digest", null: false
    t.string "public_uid", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["public_uid"], name: "index_users_on_public_uid", unique: true
  end

  add_foreign_key "bookmarks", "materials"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "material_tags", "materials"
  add_foreign_key "material_tags", "tags"
  add_foreign_key "materials", "categories"
  add_foreign_key "notifications", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "reviews", "materials"
  add_foreign_key "reviews", "users"
  add_foreign_key "sessions", "admins"
  add_foreign_key "sessions", "users"
end
