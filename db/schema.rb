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

ActiveRecord::Schema.define(version: 20160406193536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name_eng"
    t.string   "name_ko"
    t.string   "category_type"
    t.integer  "level"
    t.integer  "uplevel_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "disease_categories", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "disease_categories", ["category_id"], name: "index_disease_categories_on_category_id", using: :btree
  add_index "disease_categories", ["disease_id"], name: "index_disease_categories_on_disease_id", using: :btree

  create_table "disease_subindications", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "subindication_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "disease_subindications", ["disease_id"], name: "index_disease_subindications_on_disease_id", using: :btree
  add_index "disease_subindications", ["subindication_id"], name: "index_disease_subindications_on_subindication_id", using: :btree

  create_table "disease_zangfus", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "zangfu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "disease_zangfus", ["disease_id"], name: "index_disease_zangfus_on_disease_id", using: :btree
  add_index "disease_zangfus", ["zangfu_id"], name: "index_disease_zangfus_on_zangfu_id", using: :btree

  create_table "diseases", force: :cascade do |t|
    t.string   "name_eng"
    t.string   "name_ko"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name_tcm"
    t.string   "western_dx"
    t.string   "tcm_dx"
  end

  create_table "formular_indications", force: :cascade do |t|
    t.integer  "herbalformular_id"
    t.integer  "indication_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "formular_indications", ["herbalformular_id"], name: "index_formular_indications_on_herbalformular_id", using: :btree
  add_index "formular_indications", ["indication_id"], name: "index_formular_indications_on_indication_id", using: :btree

  create_table "herb_formulars", force: :cascade do |t|
    t.integer  "herb_id"
    t.integer  "herbalformular_id"
    t.string   "qty"
    t.string   "function"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "herb_formulars", ["herb_id"], name: "index_herb_formulars_on_herb_id", using: :btree
  add_index "herb_formulars", ["herbalformular_id"], name: "index_herb_formulars_on_herbalformular_id", using: :btree

  create_table "herb_indications", force: :cascade do |t|
    t.integer  "herb_id"
    t.integer  "indication_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "herb_indications", ["herb_id"], name: "index_herb_indications_on_herb_id", using: :btree
  add_index "herb_indications", ["indication_id"], name: "index_herb_indications_on_indication_id", using: :btree

  create_table "herbalformulars", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name_eng"
    t.string   "name_ko"
    t.string   "name_la"
    t.string   "pattern"
    t.string   "action"
    t.string   "tongue"
    t.string   "pulse"
    t.string   "contraindication"
    t.string   "preparation"
    t.string   "channel"
    t.string   "westernuse"
    t.string   "note"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "herbalformulars", ["category_id"], name: "index_herbalformulars_on_category_id", using: :btree

  create_table "herbs", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name_eng"
    t.string   "name_ko"
    t.string   "name_la"
    t.string   "property"
    t.string   "nature"
    t.string   "channel"
    t.string   "contraindication"
    t.string   "westernuse"
    t.string   "qty"
    t.string   "action"
    t.string   "note"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "herbs", ["category_id"], name: "index_herbs_on_category_id", using: :btree

  create_table "indication_subindications", force: :cascade do |t|
    t.integer  "indication_id"
    t.integer  "subindication_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "indication_subindications", ["indication_id"], name: "index_indication_subindications_on_indication_id", using: :btree
  add_index "indication_subindications", ["subindication_id"], name: "index_indication_subindications_on_subindication_id", using: :btree

  create_table "indications", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name_eng"
    t.string   "name_ko"
    t.boolean  "active",      default: true
  end

  create_table "point_indications", force: :cascade do |t|
    t.integer  "point_id"
    t.integer  "indication_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "point_indications", ["indication_id"], name: "index_point_indications_on_indication_id", using: :btree
  add_index "point_indications", ["point_id"], name: "index_point_indications_on_point_id", using: :btree

  create_table "points", force: :cascade do |t|
    t.string   "name_eng"
    t.string   "name_ko"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subindications", force: :cascade do |t|
    t.string   "name_eng"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name_ko"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "zangfu_indications", force: :cascade do |t|
    t.integer  "zangfu_id"
    t.integer  "indication_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "zangfu_indications", ["indication_id"], name: "index_zangfu_indications_on_indication_id", using: :btree
  add_index "zangfu_indications", ["zangfu_id"], name: "index_zangfu_indications_on_zangfu_id", using: :btree

  create_table "zangfu_subindications", force: :cascade do |t|
    t.integer  "zangfu_id"
    t.integer  "subindication_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "zangfu_subindications", ["subindication_id"], name: "index_zangfu_subindications_on_subindication_id", using: :btree
  add_index "zangfu_subindications", ["zangfu_id"], name: "index_zangfu_subindications_on_zangfu_id", using: :btree

  create_table "zangfus", force: :cascade do |t|
    t.string   "name_eng"
    t.string   "name_ko"
    t.string   "meridian_eng"
    t.string   "meridian_ko"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "disease_categories", "categories"
  add_foreign_key "disease_categories", "diseases"
  add_foreign_key "disease_subindications", "diseases"
  add_foreign_key "disease_subindications", "subindications"
  add_foreign_key "disease_zangfus", "diseases"
  add_foreign_key "disease_zangfus", "zangfus"
  add_foreign_key "formular_indications", "herbalformulars"
  add_foreign_key "formular_indications", "indications"
  add_foreign_key "herb_formulars", "herbalformulars"
  add_foreign_key "herb_formulars", "herbs"
  add_foreign_key "herb_indications", "herbs"
  add_foreign_key "herb_indications", "indications"
  add_foreign_key "herbalformulars", "categories"
  add_foreign_key "herbs", "categories"
  add_foreign_key "indication_subindications", "indications"
  add_foreign_key "indication_subindications", "subindications"
  add_foreign_key "point_indications", "indications"
  add_foreign_key "point_indications", "points"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "zangfu_indications", "indications"
  add_foreign_key "zangfu_indications", "zangfus"
  add_foreign_key "zangfu_subindications", "subindications"
  add_foreign_key "zangfu_subindications", "zangfus"
end
