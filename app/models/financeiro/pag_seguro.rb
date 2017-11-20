class Financeiro::PagSeguro < ApplicationRecord
  enum tipo_pagamento: {
    credito:  'Cartão de Crédito',
    debito:   'Cartão de Débito'
  }

  validates_presence_of :tipo_pagamento,
                        :valor_bruto,
                        :valor_taxa,
                        :valor_liquido,
                        :data,
                        :parcelas,
                        :bandeira

  default_scope { order(data: :desc) }
  paginates_per 20

  private
    ransacker :valor_bruto do
      Arel.sql('valor_bruto::text')
    end

end
