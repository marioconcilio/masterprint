class AddStatusToCheques < ActiveRecord::Migration[5.0]
  def change
    add_column :cheques, :status, :string
  end
end
