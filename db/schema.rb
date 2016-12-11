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

ActiveRecord::Schema.define(version: 20161116022231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.string   "attach_type"
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "bench_marks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "sub_project_id"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "bench_marks", ["sub_project_id"], name: "index_bench_marks_on_sub_project_id", using: :btree

  create_table "coordinates", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "east_utm"
    t.string   "north_utm"
    t.string   "lattitude"
    t.string   "longitude"
    t.string   "time_zone"
    t.integer  "sub_project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "coordinates", ["sub_project_id"], name: "index_coordinates_on_sub_project_id", using: :btree

  create_table "custom_menus", force: :cascade do |t|
    t.string   "menu_name"
    t.string   "sub_menu_name"
    t.string   "attachment_type"
    t.integer  "sub_project_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "custom_menus", ["sub_project_id"], name: "index_custom_menus_on_sub_project_id", using: :btree

  create_table "hydralic_particulars", force: :cascade do |t|
    t.string   "from_km"
    t.string   "to_km"
    t.string   "title"
    t.text     "description"
    t.integer  "sub_project_id"
    t.string   "type"
    t.string   "hydralic_type",  default: "Canal"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "hydralic_particulars", ["sub_project_id"], name: "index_hydralic_particulars_on_sub_project_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "type"
    t.string   "attach_type"
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "site_maps", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "from_km"
    t.string   "to_km"
    t.integer  "sub_project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "site_maps", ["sub_project_id"], name: "index_site_maps_on_sub_project_id", using: :btree

  create_table "structure_drawings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "sub_project_id"
    t.string   "type"
    t.string   "structure_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "structure_drawings", ["sub_project_id"], name: "index_structure_drawings_on_sub_project_id", using: :btree

  create_table "sub_projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sub_projects", ["project_id"], name: "index_sub_projects_on_project_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_roles", ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "role",                   default: "Guest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "village_maps", force: :cascade do |t|
    t.string   "title"
    t.text     "village_name"
    t.string   "map_type",       default: "Village Map"
    t.integer  "sub_project_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "village_maps", ["sub_project_id"], name: "index_village_maps_on_sub_project_id", using: :btree

  add_foreign_key "bench_marks", "sub_projects"
  add_foreign_key "coordinates", "sub_projects"
  add_foreign_key "custom_menus", "sub_projects"
  add_foreign_key "hydralic_particulars", "sub_projects"
  add_foreign_key "site_maps", "sub_projects"
  add_foreign_key "structure_drawings", "sub_projects"
  add_foreign_key "sub_projects", "projects"
  add_foreign_key "village_maps", "sub_projects"
end
