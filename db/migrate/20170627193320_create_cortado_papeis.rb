class CreateCortadoPapeis < ActiveRecord::Migration[5.0]
  def change
    create_table :cortado_papeis do |t|
      t.string :nome
      t.string :un
      t.decimal :preco, precision: 8, scale: 2
      t.integer :qtde
      t.string :moeda, limit: 3

      t.timestamps
    end
  end
end
