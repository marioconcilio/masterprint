class AddIeToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :ie, :bigint
  end
end
