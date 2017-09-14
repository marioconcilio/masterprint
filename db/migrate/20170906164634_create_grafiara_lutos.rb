class CreateGrafiaraLutos < ActiveRecord::Migration[5.0]
  def change
    create_table :grafiara_lutos do |t|
      t.string :pagina
      t.string :referencia
      t.string :descricao
      t.decimal :preco, precision: 8, scale: 2
      t.string :un
      t.integer :qtde

      t.timestamps
    end
  end
end
