class CreateDepositos < ActiveRecord::Migration[5.0]
  def change
    create_table :depositos do |t|
      t.decimal :total, precision: 10, scale: 2
      t.integer :banco
      t.integer :agencia
      t.string :conta
      t.string :titular

      t.timestamps
    end
  end
end
