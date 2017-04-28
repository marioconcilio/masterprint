class CreateQuimicos < ActiveRecord::Migration[5.0]
  def change
    create_table :quimicos do |t|
      t.string :nome
      t.string :marca
      t.string :un
      t.decimal :preco, precision: 8, scale: 2
      t.string :moeda, limit: 3
      t.integer :qtde

      t.timestamps
    end
  end
end
