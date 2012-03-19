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

ActiveRecord::Schema.define(:version => 20120318192539) do

  create_table "houses", :force => true do |t|
    t.string   "mls"
    t.string   "stat"
    t.string   "strnum"
    t.string   "cp"
    t.string   "strname"
    t.string   "sfx"
    t.string   "rprnp"
    t.string   "lpsp"
    t.string   "rooms"
    t.string   "beds"
    t.string   "fullbaths"
    t.string   "halfbaths"
    t.string   "typ"
    t.string   "sci"
    t.string   "garages"
    t.string   "info"
    t.string   "asf"
    t.string   "yearbuilt"
    t.string   "dues"
    t.string   "bsmt"
    t.string   "bsmtdesc"
    t.string   "city"
    t.date     "closedate"
    t.date     "contractdate"
    t.string   "fin"
    t.string   "hsdist"
    t.string   "hsname"
    t.date     "listdate"
    t.integer  "listprice"
    t.string   "lmt"
    t.integer  "origlistprice"
    t.string   "pin"
    t.string   "shortsale"
    t.string   "subdiv"
    t.string   "taxexempt"
    t.string   "taxyear"
    t.string   "taxes"
    t.string   "baths"
    t.string   "origrent"
    t.string   "rd"
    t.string   "rnp"
    t.string   "rp"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "houses", ["mls"], :name => "index_houses_on_mls", :unique => true

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

end
