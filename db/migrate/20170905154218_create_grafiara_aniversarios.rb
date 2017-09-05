class CreateGrafiaraAniversarios < ActiveRecord::Migration[5.0]
  def change
    create_table :grafiara_aniversarios do |t|
      t.string :pagina
      t.string :codigo
      t.decimal :preco, precision: 8, scale: 2
      t.string :un

      t.timestamps
    end
  end
end
