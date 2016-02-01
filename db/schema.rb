# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160201024947) do

  create_table "districts", force: :cascade do |t|
    t.string   "district_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "school_id"
    t.integer  "project_id"
  end

  add_index "districts", ["project_id"], name: "index_districts_on_project_id"
  add_index "districts", ["school_id"], name: "index_districts_on_school_id"

  create_table "documents", force: :cascade do |t|
    t.string   "document_name"
    t.text     "document_description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "project_id"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
  end

  add_index "documents", ["project_id"], name: "index_documents_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.text     "project_scope"
    t.string   "dsa_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "district_id"
    t.integer  "school_id"
    t.integer  "document_id"
  end

  add_index "projects", ["district_id"], name: "index_projects_on_district_id"
  add_index "projects", ["document_id"], name: "index_projects_on_document_id"
  add_index "projects", ["school_id"], name: "index_projects_on_school_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "schools", force: :cascade do |t|
    t.string   "school_name"
    t.string   "school_location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "district_id"
  end

  add_index "schools", ["district_id"], name: "index_schools_on_district_id"

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
    t.integer  "district_id"
  end

  add_index "users", ["district_id"], name: "index_users_on_district_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
