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

ActiveRecord::Schema.define(version: 20160316161624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "name"
    t.text     "experience"
    t.string   "location"
    t.string   "chef_avatar"
    t.decimal  "longitude",              precision: 9, scale: 6
    t.decimal  "latitude",               precision: 9, scale: 6
    t.integer  "service_radius"
    t.string   "specialty"
  end

  add_index "chefs", ["email"], name: "index_chefs_on_email", unique: true, using: :btree
  add_index "chefs", ["reset_password_token"], name: "index_chefs_on_reset_password_token", unique: true, using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "name"
    t.string   "location"
    t.string   "client_avatar"
    t.decimal  "longitude",              precision: 9, scale: 6
    t.decimal  "latitude",               precision: 9, scale: 6
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "chef_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["chef_id"], name: "index_orders_on_chef_id", using: :btree
  add_index "orders", ["client_id"], name: "index_orders_on_client_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.integer  "chef_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "product_picture"
    t.decimal  "price"
  end

  add_index "products", ["chef_id"], name: "index_products_on_chef_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.text     "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
    t.integer  "chef_id"
  end

end
