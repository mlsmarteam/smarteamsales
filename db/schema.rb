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

ActiveRecord::Schema.define(version: 20160402155850) do

  create_table "article_category_relationships", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "article_category_relationships", ["article_id"], name: "index_article_category_relationships_on_article_id"
  add_index "article_category_relationships", ["category_id"], name: "index_article_category_relationships_on_category_id"

  create_table "article_company_relationships", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "article_company_relationships", ["article_id"], name: "index_article_company_relationships_on_article_id"
  add_index "article_company_relationships", ["company_id"], name: "index_article_company_relationships_on_company_id"

  create_table "article_sale_relationships", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "sale_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "article_sale_relationships", ["article_id"], name: "index_article_sale_relationships_on_article_id"
  add_index "article_sale_relationships", ["sale_id"], name: "index_article_sale_relationships_on_sale_id"

  create_table "articles", force: :cascade do |t|
    t.string   "barcode"
    t.float    "purchase_amount"
    t.float    "sale_amount"
    t.integer  "min_stock"
    t.integer  "max_stock"
    t.integer  "quantity"
    t.integer  "mark_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
  end

  add_index "articles", ["mark_id"], name: "index_articles_on_mark_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cities", ["province_id"], name: "index_cities_on_province_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "cuit"
    t.string   "street"
    t.string   "number"
    t.integer  "floor"
    t.string   "apartment"
    t.integer  "city_id"
    t.string   "fixed_tel"
    t.string   "cel_tel"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "companies", ["city_id"], name: "index_companies_on_city_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doc_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenditure_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenditure_user_relationships", force: :cascade do |t|
    t.integer  "expenditure_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "expenditure_user_relationships", ["expenditure_id"], name: "index_expenditure_user_relationships_on_expenditure_id"
  add_index "expenditure_user_relationships", ["user_id"], name: "index_expenditure_user_relationships_on_user_id"

  create_table "expenditures", force: :cascade do |t|
    t.integer  "expenditure_type_id"
    t.float    "amount"
    t.text     "description"
    t.datetime "date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "expenditures", ["expenditure_type_id"], name: "index_expenditures_on_expenditure_type_id"

  create_table "marks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id"

  create_table "sales", force: :cascade do |t|
    t.float    "amount"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sales", ["user_id"], name: "index_sales_on_user_id"

  create_table "turns", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_turn_relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "turn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_turn_relationships", ["turn_id"], name: "index_user_turn_relationships_on_turn_id"
  add_index "user_turn_relationships", ["user_id"], name: "index_user_turn_relationships_on_user_id"

  create_table "users", force: :cascade do |t|
    t.integer  "doc_type_id"
    t.string   "doc_number"
    t.string   "name"
    t.string   "last_name"
    t.string   "street"
    t.string   "number"
    t.string   "floor"
    t.string   "apartment"
    t.integer  "city_id"
    t.string   "fixed_tel"
    t.string   "cel_tel"
    t.string   "email"
    t.string   "cuil"
    t.datetime "birthdate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id"
  add_index "users", ["doc_type_id"], name: "index_users_on_doc_type_id"

end
