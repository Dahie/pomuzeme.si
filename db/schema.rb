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

ActiveRecord::Schema.define(version: 2020_03_18_113649) do

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

  create_table "organisations", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", null: false
    t.string "business_id_number"
    t.string "contact_person", null: false
    t.string "contact_person_phone", null: false
    t.string "contact_person_email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "created_by_id", null: false
    t.bigint "closed_by_id"
    t.bigint "coordinator_id"
    t.bigint "organisation_id"
    t.integer "required_volunteer_count", null: false
    t.integer "state", default: 1, null: false
    t.integer "closed_state"
    t.string "text", limit: 160, null: false
    t.string "subscriber", limit: 150, null: false
    t.string "subscriber_phone", limit: 20, null: false
    t.string "closed_note", limit: 500
    t.datetime "fullfillment_date"
    t.datetime "closed_at"
    t.datetime "state_last_updated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["closed_by_id"], name: "index_requests_on_closed_by_id"
    t.index ["coordinator_id"], name: "index_requests_on_coordinator_id"
    t.index ["created_by_id"], name: "index_requests_on_created_by_id"
    t.index ["organisation_id"], name: "index_requests_on_organisation_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "street", null: false
    t.string "city", null: false
    t.string "zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "confirmation_code"
    t.datetime "confirmation_valid_to"
    t.datetime "confirmed_at"
    t.string "street_number", null: false
    t.string "city_part", null: false
    t.string "geo_entry_id", null: false
    t.string "geo_unit_id", null: false
    t.float "geo_coord_x", null: false
    t.float "geo_coord_y", null: false
    t.text "description"
    t.index ["phone"], name: "index_volunteers_on_phone"
  end

end
