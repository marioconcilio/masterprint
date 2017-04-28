class CreateEnvelopes < ActiveRecord::Migration[5.0]
  def change
    create_table :envelopes do |t|
      t.string :nome
      t.decimal :preco_milheiro, precision: 8, scale: 2
      t.string :moeda, limit: 3
      t.integer :qtde
      t.integer :un
      t.integer :grs
      t.integer :larg
      t.integer :comp
      t.string :tipo

      t.timestamps
    end
  end
end
