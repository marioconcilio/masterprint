class AddNomeToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :nome, :string
    add_column :clientes, :contato, :string
  end
end
