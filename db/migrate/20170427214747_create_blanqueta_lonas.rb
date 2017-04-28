class CreateBlanquetaLonas < ActiveRecord::Migration[5.0]
  def change
    create_table :blanqueta_lonas do |t|
      t.integer :lonas
      t.decimal :preco, precision: 8, scale: 2

      t.timestamps
    end
  end
end
