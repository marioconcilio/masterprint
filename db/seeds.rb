# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

PATH = "#{Rails.root}/lib/seeds"

=begin
# Clientes
Cliente.transaction do
  clientes = CSV.read("#{PATH}/clientes.csv", col_sep: ';')
  columns = [:id, :nome, :email, :endereco, :cidade, :uf, :cep]
  Cliente.import columns, clientes, validate: true
end

# Recebimentos
Recebimento.transaction do
  recebimentos = CSV.read("#{PATH}/recebimentos.csv")
  columns = [:id, :vencimento, :status, :valor, :cliente_id]
  Recebimento.import columns, recebimentos, validate: true
end

# Blanqueta Lonas
BlanquetaLona.transaction do
  lonas = CSV.read("#{PATH}/blanqueta_lonas.csv")
  columns = [:lonas, :preco]
  BlanquetaLona.import columns, lonas, validate: true
end

# Blanquetas
Blanqueta.transaction do
  blanquetas = CSV.read("#{PATH}/blanquetas.csv")
  columns = [:larg, :comp, :nome, :blanqueta_lona_id, :moeda, :qtde]
  Blanqueta.import columns, blanquetas, validate: true
end

# Chapa Marcas
ChapaMarca.transaction do
  marcas = CSV.read("#{PATH}/chapa_marcas.csv")
  columns = [:id, :marca, :preco, :esp]
  ChapaMarca.import columns, marcas, validate: true
end

# Chapas
Chapa.transaction do
  chapas = CSV.read("#{PATH}/chapas.csv")
  columns = [:larg, :comp, :chapa_marca_id, :moeda, :qtde]
  Chapa.import columns, chapas, validate: true
end

# Envelopes
Envelope.transaction do
  envelopes = CSV.read("#{PATH}/envelopes.csv")
  columns = [:nome, :larg, :comp, :grs, :tipo, :un, :preco_milheiro, :moeda, :qtde]
  Envelope.import columns, envelopes, validate: true
end

# Quimicos
Quimico.transaction do
  quimicos = CSV.read("#{PATH}/quimicos.csv")
  columns = [:nome, :marca, :un, :preco, :moeda, :qtde]
  Quimico.import columns, quimicos, validate: true
end

# Tintas
Tinta.transaction do
  tintas = CSV.read("#{PATH}/tintas.csv")
  columns = [:nome, :marca, :un, :preco_kg, :moeda, :qtde]
  Tinta.import columns, tintas, validate: true
end

# Variados
Variado.transaction do
  variados = CSV.read("#{PATH}/variados.csv")
  column = [:nome, :un, :preco, :moeda, :qtde]
  Variado.import column, variados, validate: :true
end
=end

# Papel Tipos
PapelTipo.transaction do
  tipos = CSV.read("#{PATH}/papel_tipos.csv")
  column = [:tipo, :descricao, :preco_kg, :moeda]
  PapelTipo.import(column, tipos, validate: :true)
end

# Papeis
Papel.transaction do
  papeis = CSV.read("#{PATH}/papeis.csv")
  column = [:papel_tipo_id, :subtipo, :grs, :larg, :comp, :fls, :marca, :peso, :qtde]
  Papel.import(column, papeis, validate: :true)
end
