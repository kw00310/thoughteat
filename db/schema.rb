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

ActiveRecord::Schema.define(version: 20180413123748) do

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "ingredients"
    t.text     "method"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recipes", ["user_id", "created_at"], name: "index_recipes_on_user_id_and_created_at"
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "souschef_id"
    t.integer  "connoisseur_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "relationships", ["connoisseur_id"], name: "index_relationships_on_connoisseur_id"
  add_index "relationships", ["souschef_id", "connoisseur_id"], name: "index_relationships_on_souschef_id_and_connoisseur_id", unique: true
  add_index "relationships", ["souschef_id"], name: "index_relationships_on_souschef_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "password_digest"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
