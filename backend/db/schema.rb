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

ActiveRecord::Schema.define(version: 2020_06_06_180341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "constituents", force: :cascade do |t|
    t.bigint "spice_id", null: false
    t.string "compound"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spice_id"], name: "index_constituents_on_spice_id"
  end

  create_table "families", force: :cascade do |t|
    t.bigint "spice_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spice_id"], name: "index_families_on_spice_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "spice_id", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "caption"
    t.index ["spice_id"], name: "index_images_on_spice_id"
  end

  create_table "origins", force: :cascade do |t|
    t.bigint "spice_id", null: false
    t.string "area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spice_id"], name: "index_origins_on_spice_id"
  end

  create_table "parts", force: :cascade do |t|
    t.bigint "spice_id", null: false
    t.string "part"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spice_id"], name: "index_parts_on_spice_id"
  end

  create_table "spice_constituents", force: :cascade do |t|
    t.bigint "spice_id", null: false
    t.bigint "constituent_id", null: false
    t.string "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["constituent_id"], name: "index_spice_constituents_on_constituent_id"
    t.index ["spice_id"], name: "index_spice_constituents_on_spice_id"
  end

  create_table "spices", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "etymology"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "constituents", "spices"
  add_foreign_key "families", "spices"
  add_foreign_key "images", "spices"
  add_foreign_key "origins", "spices"
  add_foreign_key "parts", "spices"
  add_foreign_key "spice_constituents", "constituents"
  add_foreign_key "spice_constituents", "spices"
end
