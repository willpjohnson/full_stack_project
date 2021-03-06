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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170711014001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annotations", force: :cascade do |t|
    t.integer  "track_id",               null: false
    t.integer  "author_id",              null: false
    t.text     "body",                   null: false
    t.integer  "score",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "start_idx"
    t.integer  "end_idx"
    t.index ["author_id"], name: "index_annotations_on_author_id", using: :btree
    t.index ["track_id"], name: "index_annotations_on_track_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body",                         null: false
    t.integer  "score",            default: 0, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "author_id",                    null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",     null: false
    t.integer  "track_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer  "author_id",          null: false
    t.string   "title",              null: false
    t.text     "body",               null: false
    t.string   "artist",             null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["author_id"], name: "index_tracks_on_author_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",            null: false
    t.string   "password_digest",     null: false
    t.string   "session_token",       null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "user_id",      null: false
    t.integer  "value",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
    t.index ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree
  end

end
