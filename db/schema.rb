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

ActiveRecord::Schema.define(:version => 20130601115927) do

  create_table "actions", :force => true do |t|
    t.integer  "player_id"
    t.string   "deploy_ap"
    t.string   "destroy_ap"
    t.datetime "action_at"
    t.integer  "deployes"
    t.integer  "destroyes"
  end

  create_table "areas", :force => true do |t|
    t.string "name"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.string   "action"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "fraction"
    t.integer  "level"
    t.string   "realname"
    t.string   "gplus"
    t.string   "vk"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.string   "location"
    t.string   "transport"
  end

  create_table "portals", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "uid"
    t.integer  "lat"
    t.integer  "lng"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "area_id"
  end

  add_index "portals", ["lat", "lng"], :name => "index_portals_on_lat_and_lng"
  add_index "portals", ["uid"], :name => "index_portals_on_uid", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                    :default => "", :null => false
    t.string   "encrypted_password",       :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "player_confirmation_code"
    t.integer  "player_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_permissions", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "permission_id"
  end

end
