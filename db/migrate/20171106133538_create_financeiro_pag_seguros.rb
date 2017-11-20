class CreateFinanceiroPagSeguros < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'
    create_table :financeiro_pag_seguros, id: :uuid do |t|
      t.string :tipo_pagamento
      t.decimal :valor_bruto, precision: 12, scale: 2
      t.decimal :valor_taxa, precision: 12, scale: 2
      t.decimal :valor_liquido, precision: 12, scale: 2
      t.date :data
      t.integer :parcelas
      t.string :bandeira

      t.timestamps
    end
  end
end
