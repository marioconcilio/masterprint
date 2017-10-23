class CreateTiktakCalendarios < ActiveRecord::Migration[5.0]
  def change
    create_table :tiktak_calendarios do |t|
      t.string :pagina
      t.string :referencia
      t.string :tipo
      t.text :descricao
      t.decimal :preco, precision: 8, scale: 2
      t.string :un

      t.timestamps
    end
  end
end
