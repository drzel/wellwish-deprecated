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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151117085110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.integer  "wish_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "images", ["wish_id"], name: "index_images_on_wish_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "wish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["wish_id"], name: "index_locations_on_wish_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_users", id: false, force: :cascade do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  add_index "skills_users", ["skill_id"], name: "index_skills_users_on_skill_id", using: :btree
  add_index "skills_users", ["user_id"], name: "index_skills_users_on_user_id", using: :btree

  create_table "skills_wishes", id: false, force: :cascade do |t|
    t.integer "skill_id"
    t.integer "wish_id"
  end

  add_index "skills_wishes", ["skill_id"], name: "index_skills_wishes_on_skill_id", using: :btree
  add_index "skills_wishes", ["wish_id"], name: "index_skills_wishes_on_wish_id", using: :btree

  create_table "tools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools_users", id: false, force: :cascade do |t|
    t.integer "tool_id"
    t.integer "user_id"
  end

  add_index "tools_users", ["tool_id"], name: "index_tools_users_on_tool_id", using: :btree
  add_index "tools_users", ["user_id"], name: "index_tools_users_on_user_id", using: :btree

  create_table "tools_wishes", id: false, force: :cascade do |t|
    t.integer "tool_id"
    t.integer "wish_id"
  end

  add_index "tools_wishes", ["tool_id"], name: "index_tools_wishes_on_tool_id", using: :btree
  add_index "tools_wishes", ["wish_id"], name: "index_tools_wishes_on_wish_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  create_table "wishes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "wishes", ["cached_votes_down"], name: "index_wishes_on_cached_votes_down", using: :btree
  add_index "wishes", ["cached_votes_score"], name: "index_wishes_on_cached_votes_score", using: :btree
  add_index "wishes", ["cached_votes_total"], name: "index_wishes_on_cached_votes_total", using: :btree
  add_index "wishes", ["cached_votes_up"], name: "index_wishes_on_cached_votes_up", using: :btree
  add_index "wishes", ["cached_weighted_average"], name: "index_wishes_on_cached_weighted_average", using: :btree
  add_index "wishes", ["cached_weighted_score"], name: "index_wishes_on_cached_weighted_score", using: :btree
  add_index "wishes", ["cached_weighted_total"], name: "index_wishes_on_cached_weighted_total", using: :btree
  add_index "wishes", ["user_id"], name: "index_wishes_on_user_id", using: :btree

  add_foreign_key "images", "wishes"
end
