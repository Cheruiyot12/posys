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

ActiveRecord::Schema.define(version: 20150905044646) do

  create_table "banks", force: true do |t|
    t.string   "bank_transfer_date"
    t.string   "amount"
    t.string   "supplier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "to_give"
    t.string   "to_get"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.string   "invoice_number"
    t.string   "customer_name"
    t.string   "phone_number"
    t.string   "payment_type"
    t.string   "purchase_item"
    t.string   "sale_id"
    t.string   "invoice_status"
    t.string   "count"
    t.integer  "item_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thismonth"
  end

  create_table "line_charts", force: true do |t|
    t.string   "month_name"
    t.string   "year"
    t.string   "total_income"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "money_uages", force: true do |t|
    t.string   "transaction_date"
    t.string   "income"
    t.string   "outcome"
    t.string   "money_in_shop"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_books", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_histories", force: true do |t|
    t.integer  "supplier_id"
    t.string   "phone"
    t.string   "payment"
    t.string   "purchase_item"
    t.integer  "count",              default: 0
    t.string   "voucher_no"
    t.integer  "brand_id"
    t.integer  "type_id"
    t.integer  "item_price",         default: 0
    t.integer  "total_cash"
    t.string   "new_purchase_item"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thismonth"
    t.string   "purchase_item1"
    t.string   "count1",             default: "0"
    t.string   "type1"
    t.string   "item_price1",        default: "0"
    t.string   "purchase_item2"
    t.string   "count2",             default: "0"
    t.string   "type2"
    t.string   "item_price2",        default: "0"
    t.string   "purchase_item3"
    t.string   "count3",             default: "0"
    t.string   "type3"
    t.string   "item_price3",        default: "0"
    t.string   "purchase_item4"
    t.string   "count4",             default: "0"
    t.string   "type4"
    t.string   "item_price4",        default: "0"
    t.string   "purchase_item5"
    t.string   "count5",             default: "0"
    t.string   "type5"
    t.string   "item_price5",        default: "0"
    t.string   "purchase_item6"
    t.string   "count6",             default: "0"
    t.string   "type6"
    t.string   "item_price6",        default: "0"
    t.string   "purchase_item7"
    t.string   "count7",             default: "0"
    t.string   "type7"
    t.string   "item_price7",        default: "0"
    t.string   "purchase_item8"
    t.string   "count8",             default: "0"
    t.string   "type8"
    t.string   "item_price8",        default: "0"
    t.string   "purchase_item9"
    t.string   "count9",             default: "0"
    t.string   "type9"
    t.string   "item_price9",        default: "0"
    t.string   "purchase_date"
    t.string   "stock_arrival_date"
  end

  create_table "raw_materials", force: true do |t|
    t.string   "name"
    t.string   "price"
    t.string   "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "count"
    t.string   "status"
    t.integer  "item_price"
    t.boolean  "check",        default: false
    t.string   "sale_method"
    t.string   "sale_name"
    t.string   "customer_id"
    t.string   "phone_number"
  end

  create_table "stocks", force: true do |t|
    t.string   "brand"
    t.string   "type_id"
    t.integer  "pricing"
    t.string   "fact_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_item"
    t.integer  "purchase_price"
    t.integer  "item_price",      default: 0
    t.integer  "wholesale_price", default: 0
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "debit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
