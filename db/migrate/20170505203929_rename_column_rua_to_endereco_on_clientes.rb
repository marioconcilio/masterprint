class RenameColumnRuaToEnderecoOnClientes < ActiveRecord::Migration[5.0]
  def change
    rename_column :clientes, :rua, :endereco
  end
end
