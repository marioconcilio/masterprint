class AddTelefoneToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :telefone, :string
    add_column :clientes, :celular, :string
  end
end
