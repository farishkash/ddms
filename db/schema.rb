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

ActiveRecord::Schema.define(version: 20160125201653) do

  create_table "districts", force: :cascade do |t|
    t.string   "district_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "projects_id"
    t.integer  "schools_id"
    t.integer  "school_id"
    t.integer  "project_id"
  end

  add_index "districts", ["project_id"], name: "index_districts_on_project_id"
  add_index "districts", ["projects_id"], name: "index_districts_on_projects_id"
  add_index "districts", ["school_id"], name: "index_districts_on_school_id"
  add_index "districts", ["schools_id"], name: "index_districts_on_schools_id"

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

  create_table "schools", force: :cascade do |t|
    t.string   "school_name"
    t.string   "school_location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "district_id"
  end

  add_index "schools", ["district_id"], name: "index_schools_on_district_id"

end
