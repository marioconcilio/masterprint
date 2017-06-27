class CreatePapelTipos < ActiveRecord::Migration[5.0]
  def change
    create_table :papel_tipos do |t|
      t.string :tipo
      t.string :descricao
      t.decimal :preco_kg, precision: 8, scale: 2
      t.string :moeda, limit: 3

      t.timestamps
    end
  end
end
