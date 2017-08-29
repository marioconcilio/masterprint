class CreateGrafiaraFolhinhas < ActiveRecord::Migration[5.0]
  def change
    create_table :grafiara_folhinhas do |t|
      t.string :pagina
      t.text :referencia
      t.text :descricao
      t.string :un
      t.decimal :preco, precision: 8, scale: 2

      t.timestamps
    end
  end
end
