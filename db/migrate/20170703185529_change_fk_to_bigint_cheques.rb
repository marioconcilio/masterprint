class ChangeFkToBigintCheques < ActiveRecord::Migration[5.0]
  def change
    change_column :cheques, :cliente_id, :bigint
  end
end
