class ChangePkFkToBigintRecebimentos < ActiveRecord::Migration[5.0]
  def change
    change_column :recebimentos, :id, :bigint
    change_column :recebimentos, :cliente_id, :bigint
  end
end
