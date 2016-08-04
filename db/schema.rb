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

ActiveRecord::Schema.define(version: 20160802130157) do

  create_table "day_actions", force: :cascade do |t|
    t.date     "day"
    t.integer  "importance"
    t.integer  "duration"
    t.string   "action"
    t.string   "result"
    t.string   "target"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "day_actions", ["user_id"], name: "index_day_actions_on_user_id"

  create_table "day_agendas", force: :cascade do |t|
    t.date     "day"
    t.string   "agenda"
    t.string   "quote"
    t.string   "targets"
    t.string   "actions"
    t.string   "success"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "day_agendas", ["user_id"], name: "index_day_agendas_on_user_id"

  create_table "deadlines", force: :cascade do |t|
    t.date     "deadline"
    t.string   "result"
    t.string   "target"
    t.integer  "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "deadlines", ["domain_id"], name: "index_deadlines_on_domain_id"

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "note"
    t.string   "explanation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "month_actions", force: :cascade do |t|
    t.date     "month"
    t.string   "result"
    t.string   "target"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "month_actions", ["user_id"], name: "index_month_actions_on_user_id"

  create_table "plans", force: :cascade do |t|
    t.string   "vision"
    t.string   "target"
    t.string   "role"
    t.string   "axis"
    t.string   "resources"
    t.integer  "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "plan"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
