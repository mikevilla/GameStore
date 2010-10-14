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

ActiveRecord::Schema.define(:version => 20100928065800) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "zip_code"
    t.string   "street",     :null => false
    t.string   "city",       :null => false
    t.string   "country",    :null => false
    t.string   "phone",      :null => false
  end

  create_table "developers", :force => true do |t|
    t.string   "name"
    t.string   "year_established"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "publisher_id"
    t.string   "title"
    t.string   "platform"
    t.string   "item_platform"
    t.string   "category"
    t.string   "disc_condition"
    t.string   "availability"
    t.string   "esrb"
    t.string   "rating"
    t.integer  "price",          :limit => 10, :precision => 10, :scale => 0
    t.datetime "release_date"
    t.datetime "pre_order_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_path"
    t.integer  "edition_id"
    t.integer  "developer_id"
    t.string   "remarks"
  end

  create_table "games_platforms", :id => false, :force => true do |t|
    t.integer  "game_id"
    t.integer  "platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "game_id"
    t.integer  "quantity"
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invoice_number"
    t.integer  "customer_id"
  end

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.integer  "year_established"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
