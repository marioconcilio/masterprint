class CreateTintas < ActiveRecord::Migration[5.0]
  def change
    create_table :tintas do |t|
      t.string :nome
      t.string :marca
      t.decimal :preco_kg, precision: 8, scale: 2
      t.integer :qtde
      t.decimal :un, precision: 5, scale: 2
      t.string :moeda, limit: 3

      t.timestamps
    end
  end
end
