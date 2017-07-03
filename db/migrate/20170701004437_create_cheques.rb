class CreateCheques < ActiveRecord::Migration[5.0]
  def change
    create_table :cheques do |t|
      t.integer :banco
      t.integer :numero
      t.string :emitente
      t.decimal :valor, precision: 10, scale: 2
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
