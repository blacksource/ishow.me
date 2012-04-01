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

ActiveRecord::Schema.define(:version => 20120401135452) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider",           :limit => 20
    t.string   "oauth_token",        :limit => 100
    t.string   "oauth_token_secret", :limit => 100
    t.string   "uid",                :limit => 50
    t.string   "user_name",          :limit => 50
    t.string   "image",              :limit => 100
    t.string   "email",              :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",            :limit => 100
    t.decimal  "price",                          :precision => 10, :scale => 0
    t.string   "image_url"
    t.string   "source_url"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "max_share_count"
    t.integer  "shared_count"
    t.string   "status",                                                        :default => "A"
    t.integer  "created_by"
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rebates", :force => true do |t|
    t.integer  "level"
    t.decimal  "amount",     :precision => 10, :scale => 0
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", :force => true do |t|
    t.integer  "sid"
    t.string   "url"
    t.string   "title"
    t.integer  "saller_id"
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
