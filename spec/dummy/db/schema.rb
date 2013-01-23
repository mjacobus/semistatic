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

ActiveRecord::Schema.define(:version => 20130123191557) do

  create_table "zpages_pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "template_name"
  end

  create_table "zpages_parts", :force => true do |t|
    t.string   "name"
    t.integer  "page_id"
    t.text     "value"
    t.string   "file_file_name"
    t.integer  "file_file_size"
    t.string   "file_content_type"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "options"
  end

  add_index "zpages_parts", ["page_id"], :name => "index_zpages_parts_on_page_id"

end
