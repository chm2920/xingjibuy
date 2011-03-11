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

ActiveRecord::Schema.define(:version => 20110311024635) do

  create_table "deals", :force => true do |t|
    t.string   "title"
    t.integer  "price"
    t.integer  "i_price"
    t.integer  "discount"
    t.integer  "save_money"
    t.integer  "low_ps"
    t.string   "image_file_name"
    t.string   "ad_text"
    t.text     "info"
    t.string   "company"
    t.text     "com_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kindeditor_images", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "run_logs", :force => true do |t|
    t.string   "log_path"
    t.string   "log_method"
    t.string   "log_params"
    t.string   "log_exception"
    t.string   "log_remote_ip"
    t.datetime "created_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.integer  "login_times",      :default => 0, :null => false
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.integer  "state",            :default => 0, :null => false
    t.integer  "coins",            :default => 0, :null => false
    t.integer  "money",            :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
