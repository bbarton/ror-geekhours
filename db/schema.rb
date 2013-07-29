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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130726095313) do

  create_table "addresses", :force => true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "street_name"
    t.string   "zipcode"
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "banners", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "billing_addresses", :force => true do |t|
    t.string   "street_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "contact_number"
    t.integer  "order_id"
  end

  add_index "billing_addresses", ["user_id"], :name => "index_billing_addresses_on_user_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "order_number"
    t.datetime "from"
    t.datetime "to"
    t.string   "parking_lot_profile_number"
    t.integer  "quantity"
    t.string   "state"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "variant_type"
  end

  create_table "people", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.integer  "contact_number",         :limit => 8
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type"
  end

  add_index "people", ["confirmation_token"], :name => "index_people_on_confirmation_token", :unique => true
  add_index "people", ["email"], :name => "index_people_on_email", :unique => true
  add_index "people", ["reset_password_token"], :name => "index_people_on_reset_password_token", :unique => true

  create_table "reservations", :force => true do |t|
    t.boolean  "cancellation_protection"
    t.integer  "no_of_passengers"
    t.string   "vehicle_number"
    t.integer  "order_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "reservations", ["order_id"], :name => "index_reservations_on_order_id"

  create_table "secondary_users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "secondary_users", ["user_id"], :name => "index_secondary_users_on_User_id"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "team_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

end
