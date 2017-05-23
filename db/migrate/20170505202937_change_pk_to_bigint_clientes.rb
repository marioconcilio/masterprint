class ChangePkToBigintClientes < ActiveRecord::Migration[5.0]
  def change
    change_column :clientes, :id, :bigint
  end
end
