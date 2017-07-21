class Recebimento < ApplicationRecord
  enum status: {
    aguardando:   'Aguardando',
    aberto:       'Em aberto',
    cartorio:     'Cartório',
    protestado:   'Protestado',
    titulo_maos:  'Título em mãos',
    pago:         'Pago'
  }

  paginates_per 50
  default_scope -> { order(vencimento: :desc, id: :desc) }
  # scope :status, -> (status) { where('status ilike ?', status) }

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
