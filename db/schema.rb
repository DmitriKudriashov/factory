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

ActiveRecord::Schema.define(version: 20171027084431) do

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "budgetitems", force: :cascade do |t|
    t.string   "name"
    t.string   "codeitem",   limit: 10
    t.string   "shortname",  limit: 20
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["codeitem"], name: "index_budgetitems_on_codeitem", unique: true
    t.index ["name"], name: "index_budgetitems_on_name", unique: true
    t.index ["shortname"], name: "index_budgetitems_on_shortname"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.string   "curry_code", limit: 3, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["curry_code"], name: "index_currencies_on_curry_code", unique: true
    t.index ["name"], name: "index_currencies_on_name", unique: true
  end

  create_table "descriptions", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id", default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["category_id"], name: "index_descriptions_on_category_id"
    t.index ["name"], name: "index_descriptions_on_name", unique: true
  end

  create_table "inventories", force: :cascade do |t|
    t.decimal  "quantity",                                default: "0.0"
    t.integer  "budgetsitem_id"
    t.integer  "description_id"
    t.integer  "brand_id"
    t.string   "serial_number"
    t.integer  "supplier_id"
    t.decimal  "price_curry",    precision: 15, scale: 2
    t.decimal  "sum_curry",      precision: 15, scale: 2
    t.decimal  "price_usd",      precision: 15, scale: 2
    t.decimal  "sum_usd",        precision: 15, scale: 2
    t.integer  "ratecurry_id"
    t.integer  "currency_id"
    t.integer  "unit_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.index ["brand_id"], name: "index_inventories_on_brand_id"
    t.index ["budgetsitem_id"], name: "index_inventories_on_budgetsitem_id"
    t.index ["currency_id"], name: "index_inventories_on_currency_id"
    t.index ["description_id"], name: "index_inventories_on_description_id"
    t.index ["ratecurry_id"], name: "index_inventories_on_ratecurry_id"
    t.index ["supplier_id"], name: "index_inventories_on_supplier_id"
    t.index ["unit_id"], name: "index_inventories_on_unit_id"
  end

  create_table "modelprices", force: :cascade do |t|
    t.integer  "modelset_id"
    t.integer  "category_id"
    t.integer  "description_id"
    t.decimal  "quantty",        precision: 15, scale: 4
    t.integer  "unit_id"
    t.decimal  "unit_price",     precision: 15, scale: 2
    t.integer  "currency_id"
    t.integer  "ratecurry_id"
    t.decimal  "sum_curry",      precision: 15, scale: 2
    t.decimal  "sum_usd",        precision: 15, scale: 2
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["category_id"], name: "index_modelprices_on_category_id"
    t.index ["currency_id"], name: "index_modelprices_on_currency_id"
    t.index ["description_id"], name: "index_modelprices_on_description_id"
    t.index ["modelset_id"], name: "index_modelprices_on_modelset_id"
    t.index ["ratecurry_id"], name: "index_modelprices_on_ratecurry_id"
    t.index ["unit_id"], name: "index_modelprices_on_unit_id"
  end

  create_table "modelsets", force: :cascade do |t|
    t.string   "number_model"
    t.date     "date_model",   default: '2017-10-27', null: false
    t.integer  "product_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["number_model"], name: "index_modelsets_on_number_model", unique: true
    t.index ["product_id"], name: "index_modelsets_on_product_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "ratecurries", force: :cascade do |t|
    t.integer  "currency_id"
    t.decimal  "rate",        precision: 15, scale: 4
    t.date     "date_rate",                            default: '2017-10-27'
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.index ["currency_id"], name: "index_ratecurries_on_currency_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_suppliers_on_name", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_units_on_name", unique: true
  end

end
