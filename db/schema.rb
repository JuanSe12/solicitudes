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

ActiveRecord::Schema.define(version: 20160127180157) do

  create_table "pruebas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "edad",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "telefono",   limit: 255
    t.string   "movil",      limit: 255
    t.string   "producto",   limit: 255
    t.integer  "npro",       limit: 4
    t.string   "direccion",  limit: 255
    t.string   "email",      limit: 255
    t.integer  "estado",     limit: 4
    t.integer  "idus",       limit: 4
    t.integer  "tiposoli",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
