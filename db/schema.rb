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

ActiveRecord::Schema.define(:version => 20120324125105) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider",           :limit => 20
    t.string   "oauth_token",        :limit => 50
    t.string   "oauth_token_secret", :limit => 50
    t.string   "uid",                :limit => 20
    t.string   "user_name",          :limit => 50
    t.string   "image",              :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.string   "sex",             :default => "F"
    t.string   "status",          :default => "A"
    t.date     "birthday"
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.string   "realname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
