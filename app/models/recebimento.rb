class Recebimento < ApplicationRecord
  enum status: {
    aguardando:   'Aguardando',
    aberto:       'Em aberto',
    baixado:      'Baixado',
    cartorio:     'Cartório',
    protestado:   'Protestado',
    titulo_maos:  'Título em mãos',
    pago:         'Pago'
  }

  default_scope -> do
    order(Arel::Nodes::NamedFunction.new('recebimentos_order', [Recebimento.arel_table[:id]])
      .desc)
  end

  scope :s, -> (rcb_status) { where('status ilike ?', Recebimento.status[rcb_status]) }

  paginates_per 50
  validates_presence_of :vencimento,
                        :valor,
                        :status

  belongs_to :cliente

  def vencido?
    self.aberto? && DateTime.now > self.vencimento
  end

  private
    ransacker :numero do
      Arel.sql 'recebimentos.id::text'
    end

    ransacker :numero_order do
      Arel.sql 'recebimentos_order(recebimentos.id)'
    end

end
