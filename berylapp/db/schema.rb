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

ActiveRecord::Schema.define(version: 20190118054135) do

  create_table "abcs", force: :cascade do |t|
    t.string   "title"
    t.text     "descripton"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cdes", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "product_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pricings", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "price"
    t.integer  "compare_at_price"
    t.integer  "cost_per_item"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "product_shops", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_shops", ["product_id"], name: "index_product_shops_on_product_id"
  add_index "product_shops", ["shop_id"], name: "index_product_shops_on_shop_id"

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
