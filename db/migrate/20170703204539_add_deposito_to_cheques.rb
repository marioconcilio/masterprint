class AddDepositoToCheques < ActiveRecord::Migration[5.0]
  def change
    add_reference :cheques, :deposito, foreign_key: true
  end
end
