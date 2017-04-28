class CreateVariados < ActiveRecord::Migration[5.0]
  def change
    create_table :variados do |t|
      t.string :nome
      t.decimal :preco, precision: 8, scale: 2
      t.integer :qtde
      t.string :moeda, limit: 3
      t.string :un

      t.timestamps
    end
  end
end
