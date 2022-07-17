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

ActiveRecord::Schema[7.0].define(version: 2022_07_14_203225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "landlord"
    t.text "description"
    t.string "addrline1"
    t.string "addrline2"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.bigint "user_id", null: false
    t.string "contactno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.date "rentmonth"
    t.date "duedate"
    t.date "paymentdate"
    t.decimal "rent"
    t.decimal "gassbill"
    t.decimal "lightbill"
    t.decimal "servicecharge"
    t.boolean "status"
    t.integer "paymentmode"
    t.string "bankname"
    t.string "accountnumber"
    t.string "refnumber"
    t.bigint "user_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_rents_on_tenant_id"
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "nid"
    t.string "email"
    t.string "mobile"
    t.string "peraddrline1"
    t.string "peraddrline2"
    t.string "peraddrline3"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.date "entrydate"
    t.date "exitdate"
    t.decimal "rentpermonth"
    t.decimal "advancepaid"
    t.boolean "status"
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.bigint "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_tenants_on_property_id"
    t.index ["unit_id"], name: "index_tenants_on_unit_id"
    t.index ["user_id"], name: "index_tenants_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "bedroom"
    t.integer "bathroom"
    t.boolean "drawingroom"
    t.boolean "dining"
    t.integer "kitchen"
    t.boolean "status"
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_units_on_property_id"
    t.index ["user_id"], name: "index_units_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "properties", "users"
  add_foreign_key "rents", "tenants"
  add_foreign_key "rents", "users"
  add_foreign_key "tenants", "properties"
  add_foreign_key "tenants", "units"
  add_foreign_key "tenants", "users"
  add_foreign_key "units", "properties"
  add_foreign_key "units", "users"
end
