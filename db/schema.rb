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

ActiveRecord::Schema.define(version: 20170513191139) do

  create_table "employees", force: :cascade do |t|
    t.string "username",                 null: false
    t.string "employee_name",            null: false
    t.string "password",      limit: 32, null: false
  end

  create_table "employees_roles", id: false, force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "role_id"
  end

  add_index "employees_roles", ["role_id", "employee_id"], name: "index_employees_roles_on_role_id_and_employee_id"

  create_table "quotes", force: :cascade do |t|
    t.string "quote"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
  end

  add_index "roles", [nil], name: "index_roles_on_role_id"

end
