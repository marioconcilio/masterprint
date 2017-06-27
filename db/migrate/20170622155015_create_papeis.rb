class CreatePapeis < ActiveRecord::Migration[5.0]
  def change
    create_table :papeis do |t|
      t.integer :grs
      t.integer :larg
      t.integer :comp
      t.integer :fls
      t.decimal :peso, precision: 7, scale: 3
      t.string :marca
      t.integer :qtde
      t.references :papel_tipos, foreign_key: true

      t.timestamps
    end
  end
end
