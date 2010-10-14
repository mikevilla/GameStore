# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100926203334) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name", :null => false
    t.string   "last_name",  :null => false
    t.integer  "zip_code",   :null => false
    t.string   "street",     :null => false
    t.string   "city",       :null => false
    t.string   "country",    :null => false
    t.string   "phone",      :null => false
  end

  create_table "developers", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "year_established", :null => false
    t.text     "about",            :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "editions", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "publisher_id",                                 :null => false
    t.string   "title",                                        :null => false
    t.string   "item_platform"
    t.string   "category",                                     :null => false
    t.string   "disc_condition",                               :null => false
    t.string   "availability",                                 :null => false
    t.string   "esrb",                                         :null => false
    t.string   "rating",                                       :null => false
    t.decimal  "price",          :precision => 8, :scale => 2
    t.datetime "release_date",                                 :null => false
    t.datetime "pre_order_date",                               :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "image_path",                                   :null => false
    t.integer  "edition_id",                                   :null => false
    t.integer  "developer_id",                                 :null => false
    t.string   "remarks"
  end

  create_table "games_platforms", :id => false, :force => true do |t|
    t.integer "game_id",     :null => false
    t.integer "platform_id", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id",                                  :null => false
    t.integer  "game_id",                                   :null => false
    t.integer  "quantity",                                  :null => false
    t.decimal  "price",      :precision => 10, :scale => 2, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "orders", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "invoice_number", :null => false
    t.integer  "customer_id",    :null => false
  end

  create_table "platforms", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "publishers", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "year_established", :null => false
    t.text     "about",            :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.string   "password",   :limit => 50, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
