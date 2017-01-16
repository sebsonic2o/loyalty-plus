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

ActiveRecord::Schema.define(version: 20170116030215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "account_id", default: "", null: false
    t.string   "secret_key", default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "customer_accounts", force: :cascade do |t|
    t.integer  "points_balance",    default: 0, null: false
    t.integer  "customer_id"
    t.integer  "brand_id"
    t.integer  "reward_program_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "total_purchases",   default: 0, null: false
  end

  add_index "customer_accounts", ["brand_id"], name: "index_customer_accounts_on_brand_id", using: :btree
  add_index "customer_accounts", ["customer_id"], name: "index_customer_accounts_on_customer_id", using: :btree
  add_index "customer_accounts", ["reward_program_id"], name: "index_customer_accounts_on_reward_program_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "amount",              default: 0, null: false
    t.integer  "customer_account_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "purchases", ["customer_account_id"], name: "index_purchases_on_customer_account_id", using: :btree

  create_table "reward_programs", force: :cascade do |t|
    t.string   "name",          default: "", null: false
    t.integer  "points_dollar", default: 0,  null: false
    t.integer  "brand_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "reward_programs", ["brand_id"], name: "index_reward_programs_on_brand_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "points",              default: 0, null: false
    t.integer  "customer_account_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "rewards", ["customer_account_id"], name: "index_rewards_on_customer_account_id", using: :btree

end
