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

ActiveRecord::Schema.define(version: 20141020203533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "unsubscribed"
    t.string   "unsubscribe_reason"
  end

  add_index "contacts", ["email"], name: "index_contacts_on_email", using: :btree
  add_index "contacts", ["school_id"], name: "index_contacts_on_school_id", using: :btree

  create_table "counties", force: true do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "counties", ["name", "state"], name: "index_counties_on_name_and_state", using: :btree
  add_index "counties", ["state"], name: "index_counties_on_state", using: :btree

  create_table "districts", force: true do |t|
    t.string   "name"
    t.text     "url"
    t.integer  "county_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["county_id"], name: "index_districts_on_county_id", using: :btree
  add_index "districts", ["name"], name: "index_districts_on_name", using: :btree
  add_index "districts", ["url", "name"], name: "index_districts_on_url_and_name", using: :btree

  create_table "integer_for_primes", force: true do |t|
    t.integer  "value"
    t.boolean  "prime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "integer_for_primes", ["value"], name: "index_integer_for_primes_on_value", using: :btree

  create_table "keyword_school_links", force: true do |t|
    t.integer  "keyword_id"
    t.integer  "school_id"
    t.integer  "page_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keyword_school_links", ["keyword_id"], name: "index_keyword_school_links_on_keyword_id", using: :btree
  add_index "keyword_school_links", ["school_id"], name: "index_keyword_school_links_on_school_id", using: :btree

  create_table "keywords", force: true do |t|
    t.string   "key"
    t.text     "synonyms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keywords", ["key"], name: "index_keywords_on_key", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.text     "school_url"
    t.string   "parent_org_name"
    t.text     "parent_org_url"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "unsubscribed"
    t.string   "unsubscribe_reason"
    t.datetime "last_term_scrape"
    t.datetime "last_email_scrape"
    t.text     "parent_org_contact_url"
  end

  add_index "schools", ["district_id"], name: "index_schools_on_district_id", using: :btree
  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree
  add_index "schools", ["parent_org_url", "name"], name: "index_schools_on_parent_org_url_and_name", using: :btree

  create_table "workers", force: true do |t|
    t.string   "ip"
    t.datetime "last_request"
    t.integer  "requested"
    t.integer  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workers", ["ip"], name: "index_workers_on_ip", using: :btree

end
