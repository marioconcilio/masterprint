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

ActiveRecord::Schema.define(version: 20170803142657) do

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

  create_table "chapa_dolares", force: :cascade do |t|
    t.decimal  "value",      precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
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

  create_table "cheques", force: :cascade do |t|
    t.integer  "banco"
    t.integer  "numero"
    t.string   "emitente"
    t.decimal  "valor",         precision: 10, scale: 2
    t.date     "data_deposito"
    t.bigint   "cliente_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "deposito_id"
    t.string   "status"
    t.index ["cliente_id"], name: "index_cheques_on_cliente_id", using: :btree
    t.index ["deposito_id"], name: "index_cheques_on_deposito_id", using: :btree
  end

  create_table "clientes", id: :bigserial, force: :cascade do |t|
    t.string   "razao_social"
    t.string   "email"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "uf"
    t.integer  "cep"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "telefone"
    t.string   "celular"
    t.string   "nome"
    t.string   "contato"
    t.bigint   "ie"
  end

  create_table "cortado_papeis", force: :cascade do |t|
    t.string   "nome"
    t.string   "un"
    t.decimal  "preco",                precision: 8, scale: 2
    t.integer  "qtde"
    t.string   "moeda",      limit: 3
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "depositos", force: :cascade do |t|
    t.decimal  "total",      precision: 10, scale: 2
    t.integer  "banco"
    t.integer  "agencia"
    t.string   "conta"
    t.string   "titular"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "dolares", force: :cascade do |t|
    t.decimal  "value",      precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
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

  create_table "papeis", force: :cascade do |t|
    t.integer  "grs"
    t.integer  "larg"
    t.integer  "comp"
    t.integer  "fls"
    t.decimal  "peso",          precision: 7, scale: 3
    t.string   "marca"
    t.integer  "qtde"
    t.integer  "papel_tipo_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "subtipo"
    t.index ["papel_tipo_id"], name: "index_papeis_on_papel_tipo_id", using: :btree
  end

  create_table "papel_tipos", force: :cascade do |t|
    t.string   "tipo"
    t.string   "descricao"
    t.decimal  "preco_kg",             precision: 8, scale: 2
    t.string   "moeda",      limit: 3
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
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

  create_table "receber_boletos", id: :bigserial, force: :cascade do |t|
    t.date     "vencimento"
    t.string   "status"
    t.decimal  "valor",      precision: 12, scale: 2
    t.bigint   "cliente_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["cliente_id"], name: "index_receber_boletos_on_cliente_id", using: :btree
  end

  create_table "recebimentos", id: :bigserial, force: :cascade do |t|
    t.date     "vencimento"
    t.string   "status"
    t.decimal  "valor",      precision: 12, scale: 2
    t.bigint   "cliente_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index "recebimentos_order(id)", name: "idx_recebimentos_order", using: :btree
    t.index ["cliente_id"], name: "index_recebimentos_on_cliente_id", using: :btree
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
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
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
  add_foreign_key "cheques", "clientes"
  add_foreign_key "cheques", "depositos"
  add_foreign_key "papeis", "papel_tipos"
  add_foreign_key "receber_boletos", "clientes"
  add_foreign_key "recebimentos", "clientes"
end
