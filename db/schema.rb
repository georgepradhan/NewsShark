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

ActiveRecord::Schema.define(:version => 20131003191212) do

  add_extension "hstore"

  create_table "articles", :force => true do |t|
    t.integer  "channel_id"
    t.string   "title"
    t.string   "url"
    t.string   "keywords",      :default => [],                 :array => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_feedback"
    t.string   "publication"
    t.string   "author"
    t.integer  "word_count"
    t.integer  "kincaid"
    t.date     "datetime"
    t.text     "description"
  end

  create_table "channels", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.hstore   "preferenced_keywords"
    t.hstore   "preferenced_publications"
    t.hstore   "preferenced_authors"
    t.hstore   "preferenced_word_counts"
    t.hstore   "preferenced_kincaids"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
