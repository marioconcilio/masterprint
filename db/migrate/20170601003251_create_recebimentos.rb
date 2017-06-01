class CreateRecebimentos < ActiveRecord::Migration[5.0]
  def change
    create_table :recebimentos do |t|
      t.date :vencimento
      t.string :status
      t.decimal :valor, precision: 12, scale: 2
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
