class CreateChapaDolares < ActiveRecord::Migration[5.0]
  def change
    create_table :chapa_dolares do |t|
      t.decimal :value, precision: 5, scale: 2

      t.timestamps
    end
  end
end
