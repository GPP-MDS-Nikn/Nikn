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

ActiveRecord::Schema.define(version: 20151001203943) do

  create_table "care_units", force: :cascade do |t|
    t.string   "municipio"
    t.string   "estado"
    t.string   "cod_mun7"
    t.string   "cod_mun6"
    t.string   "uf"
    t.text     "localizacao"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "local"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
  end

  create_table "ongs", force: :cascade do |t|
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
    t.text     "description"
    t.text     "adress"
  end

  add_index "ongs", ["email"], name: "index_ongs_on_email", unique: true
  add_index "ongs", ["reset_password_token"], name: "index_ongs_on_reset_password_token", unique: true

  create_table "parsers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portal_posts", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
  end

end
