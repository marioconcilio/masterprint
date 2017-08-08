class ChangePkToBigintFornecedores < ActiveRecord::Migration[5.0]
  def change
    change_column :fornecedores, :id, :bigint
  end
end
