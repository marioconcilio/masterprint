class CreateGrafiaraCasamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :grafiara_casamentos do |t|
      t.string :pagina
      t.string :codigo
      t.text :descricao
      t.decimal :preco, precision: 8, scale: 2
      t.string :un

      t.timestamps
    end
  end
end
