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

ActiveRecord::Schema.define(:version => 20121213192607) do

  create_table "audios", :force => true do |t|
    t.string   "title"
    t.string   "audio_file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "audios_courses", :id => false, :force => true do |t|
    t.integer "audio_id"
    t.integer "course_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "teacher_id"
  end

  create_table "courses_ebooks", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "ebook_id"
  end

  create_table "courses_videos", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "video_id"
  end

  create_table "ebooks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "ebook_file"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "zip"
    t.string   "image"
    t.string   "is_admin"
    t.string   "is_teacher"
    t.string   "is_pro"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "full_name"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
