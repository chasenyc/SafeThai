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

ActiveRecord::Schema.define(version: 20160929150513) do

  create_table "dohmh_inspections", force: :cascade do |t|
    t.integer  "camis",                 limit: 10,                                  null: false
    t.string   "dba",                   limit: 255
    t.string   "address",               limit: 255
    t.string   "boro",                  limit: 255
    t.integer  "building",              limit: 10,                                  null: false
    t.string   "street",                limit: 255
    t.integer  "zipcode",               limit: 10,                                  null: false
    t.string   "phone",                 limit: 10
    t.string   "action",                limit: 255
    t.string   "violation_code",        limit: 255
    t.string   "violation_description", limit: 255
    t.string   "critical_flag",         limit: 255
    t.string   "cuisine_description",   limit: 255
    t.date     "inspection_date",                                                   null: false
    t.integer  "score",                 limit: 10
    t.string   "grade",                 limit: 10
    t.date     "grade_date"
    t.string   "inspection_type",       limit: 255
    t.date     "record_date"
    t.datetime "created_at",                        default: '2016-09-29 15:56:19', null: false
    t.datetime "updated_at",                        default: '2016-09-29 15:56:19', null: false
  end

  add_index "dohmh_inspections", ["camis", "inspection_date", "violation_code"], name: "primary_dohmh_inspections_1", unique: true

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "address",                        null: false
    t.float    "lat",                            null: false
    t.float    "lng",                            null: false
    t.string   "grade",      default: "Unknown", null: false
    t.date     "grade_date",                     null: false
    t.string   "cuisine",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
