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

ActiveRecord::Schema.define(version: 20131104230219) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.decimal  "price"
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "specials", force: true do |t|
    t.string "title"
    t.string "description"
    t.string "color"
    t.string "border"
  end

end
