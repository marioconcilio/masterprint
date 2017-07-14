class RenameNomeOnClientes < ActiveRecord::Migration[5.0]
  def change
    rename_column :clientes, :nome, :razao_social
  end
end
