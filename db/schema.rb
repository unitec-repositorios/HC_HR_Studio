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

ActiveRecord::Schema.define(version: 20171213183542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "ability_name"
  end

  create_table "abilities_employees", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "ability_id"
    t.integer  "employee_id"
    t.integer  "school_id"
  end

  create_table "abilities_positions", force: :cascade do |t|
    t.integer  "ability_id"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "applications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "area_id_number"
    t.index ["area_id_number"], name: "index_areas_on_area_id_number", unique: true, using: :btree
  end

  create_table "calls", force: :cascade do |t|
    t.string   "topic"
    t.string   "category"
    t.string   "place"
    t.date     "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ability_id"
    t.index ["ability_id"], name: "index_calls_on_ability_id", using: :btree
  end

  create_table "calls_employees", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
    t.integer  "call_id"
    t.boolean  "attended"
  end

  create_table "calls_instructors", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "instructor_id"
    t.integer  "call_id"
  end

  create_table "configurationscreens", force: :cascade do |t|
    t.text     "mission"
    t.text     "vision"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint   "area_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.string   "department_id_number"
    t.index ["area_id"], name: "index_departments_on_area_id", using: :btree
    t.index ["department_id_number"], name: "index_departments_on_department_id_number", unique: true, using: :btree
  end

  create_table "education_employees", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "education_id"
    t.integer  "employee_id"
    t.boolean  "completed"
    t.index ["education_id"], name: "index_education_employees_on_education_id", using: :btree
    t.index ["employee_id"], name: "index_education_employees_on_employee_id", using: :btree
  end

  create_table "educations", force: :cascade do |t|
    t.string   "major_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "educations_employees", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "education_id"
    t.integer  "employee_id"
    t.boolean  "completed"
    t.string   "title"
    t.integer  "school_id"
  end

  create_table "educations_positions", force: :cascade do |t|
    t.integer  "education_id"
    t.integer  "position_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.boolean  "completed"
  end

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.bigint   "position_id"
    t.string   "name"
    t.date     "birth_date"
    t.string   "birth_place"
    t.date     "hired_date"
    t.float    "salary"
    t.string   "marital_status"
    t.text     "address"
    t.string   "blood_type"
    t.string   "emergency_contact_number"
    t.string   "emergency_contact_name"
    t.string   "email"
    t.string   "rap_code"
    t.string   "cellphone"
    t.string   "bank_account"
    t.string   "contract_type"
    t.string   "gender"
    t.boolean  "employee_status"
    t.text     "layoff_reason"
    t.date     "layoff_date"
    t.string   "id_number"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "company"
    t.string   "employee_id_number"
    t.index ["employee_id_number"], name: "index_employees_on_employee_id_number", unique: true, using: :btree
    t.index ["position_id"], name: "index_employees_on_position_id", using: :btree
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "name"
    t.string   "school"
    t.string   "cellphone"
    t.string   "email"
    t.string   "profession"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id"
    t.index ["school_id"], name: "index_instructors_on_school_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.bigint   "department_id"
    t.string   "name"
    t.string   "position_id_number"
    t.text     "description"
    t.index ["department_id"], name: "index_positions_on_department_id", using: :btree
    t.index ["position_id_number"], name: "index_positions_on_position_id_number", unique: true, using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "cellphone"
    t.text     "address"
  end

  create_table "schools_educations", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "education_id"
    t.integer  "school_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "calls", "abilities"
  add_foreign_key "departments", "areas"
  add_foreign_key "employees", "positions"
  add_foreign_key "instructors", "schools"
  add_foreign_key "positions", "departments"
end
