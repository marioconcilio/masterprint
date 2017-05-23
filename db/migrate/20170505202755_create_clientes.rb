class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :email
      t.string :rua
      t.string :cidade
      t.string :uf
      t.integer :cep

      t.timestamps
    end
  end
end
