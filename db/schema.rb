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

ActiveRecord::Schema.define(version: 20170505203929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blanqueta_lonas", force: :cascade do |t|
    t.integer  "lonas"
    t.decimal  "preco",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "blanquetas", force: :cascade do |t|
    t.integer  "larg"
    t.integer  "comp"
    t.string   "nome"
    t.integer  "qtde"
    t.string   "moeda",             limit: 3
    t.integer  "blanqueta_lona_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["blanqueta_lona_id"], name: "index_blanquetas_on_blanqueta_lona_id", using: :btree
  end

  create_table "chapa_marcas", force: :cascade do |t|
    t.string   "marca"
    t.decimal  "preco",      precision: 8
    t.string   "esp"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "chapas", force: :cascade do |t|
    t.integer  "larg"
    t.integer  "comp"
    t.integer  "qtde"
    t.string   "moeda",          limit: 3
    t.integer  "chapa_marca_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["chapa_marca_id"], name: "index_chapas_on_chapa_marca_id", using: :btree
  end

  create_table "clientes", id: :bigserial, force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "uf"
    t.integer  "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "envelopes", force: :cascade do |t|
    t.string   "nome"
    t.decimal  "preco_milheiro",           precision: 8, scale: 2
    t.string   "moeda",          limit: 3
    t.integer  "qtde"
    t.integer  "un"
    t.integer  "grs"
    t.integer  "larg"
    t.integer  "comp"
    t.string   "tipo"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "quimicos", force: :cascade do |t|
    t.string   "nome"
    t.string   "marca"
    t.string   "un"
    t.decimal  "preco",                precision: 8, scale: 2
    t.string   "moeda",      limit: 3
    t.integer  "qtde"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "tintas", force: :cascade do |t|
    t.string   "nome"
    t.string   "marca"
    t.decimal  "preco_kg",             precision: 8, scale: 2
    t.integer  "qtde"
    t.decimal  "un",                   precision: 5, scale: 2
    t.string   "moeda",      limit: 3
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "usuario"
    t.string   "nome"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["usuario"], name: "index_usuarios_on_usuario", unique: true, using: :btree
  end

  create_table "variados", force: :cascade do |t|
    t.string   "nome"
    t.decimal  "preco",                precision: 8, scale: 2
    t.integer  "qtde"
    t.string   "moeda",      limit: 3
    t.string   "un"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_foreign_key "blanquetas", "blanqueta_lonas"
  add_foreign_key "chapas", "chapa_marcas"
end
