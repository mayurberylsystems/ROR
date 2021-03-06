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

ActiveRecord::Schema.define(version: 20190120014742) do

  create_table "pictures", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "correspondingimage"
  end

  create_table "productshopifies", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "productshopifies", ["shop_id"], name: "index_productshopifies_on_shop_id"

  create_table "productsimages", force: :cascade do |t|
    t.integer  "productshopify_id"
    t.string   "image"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "productsimages", ["productshopify_id"], name: "index_productsimages_on_productshopify_id"

  create_table "shopifyproducts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shopproductimages", force: :cascade do |t|
    t.integer  "shopproduct_id"
    t.string   "image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "shopproductimages", ["shopproduct_id"], name: "index_shopproductimages_on_shopproduct_id"

  create_table "shopproducts", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "title"
    t.text     "description"
    t.string   "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shopproducts", ["shop_id"], name: "index_shopproducts_on_shop_id"

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true

end
