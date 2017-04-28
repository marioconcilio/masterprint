class CreateChapaMarcas < ActiveRecord::Migration[5.0]
  def change
    create_table :chapa_marcas do |t|
      t.string :marca
      t.decimal :preco, precision: 8, decimal: 2
      t.string :esp

      t.timestamps
    end
  end
end
