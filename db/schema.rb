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

ActiveRecord::Schema.define(version: 20141104084220) do

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "isbn",         limit: 13
    t.text     "description"
    t.date     "published_at"
    t.integer  "publisher_id"
    t.integer  "page_count"
    t.decimal  "price",                   precision: 16, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "book_cover"
  end

  add_index "books", ["publisher_id"], name: "index_books_on_publisher_id"

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", force: true do |t|
    t.integer  "author_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["author_id"], name: "index_publications_on_author_id"
  add_index "publications", ["book_id"], name: "index_publications_on_book_id"

  create_table "publishers", force: true do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publishers", ["name"], name: "index_publishers_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

end
