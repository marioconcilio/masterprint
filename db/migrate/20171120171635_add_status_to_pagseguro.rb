class AddStatusToPagseguro < ActiveRecord::Migration[5.0]
  def change
    add_column :financeiro_pag_seguros, :is_ok, :boolean, default: false
  end
end
