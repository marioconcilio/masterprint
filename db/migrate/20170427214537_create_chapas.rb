class CreateChapas < ActiveRecord::Migration[5.0]
  def change
    create_table :chapas do |t|
      t.integer :larg
      t.integer :comp
      t.integer :qtde
      t.string :moeda, limit: 3
      t.references :chapa_marca, foreign_key: true

      t.timestamps
    end
  end
end
