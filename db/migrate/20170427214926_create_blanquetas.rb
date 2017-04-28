class CreateBlanquetas < ActiveRecord::Migration[5.0]
  def change
    create_table :blanquetas do |t|
      t.integer :larg
      t.integer :comp
      t.string :nome
      t.integer :qtde
      t.string :moeda, limit: 3
      t.references :blanqueta_lona, foreign_key: true

      t.timestamps
    end
  end
end
