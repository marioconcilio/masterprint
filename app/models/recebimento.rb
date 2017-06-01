class Recebimento < ApplicationRecord
  ABERTO      = 'ABERTO'
  PAGO        = 'LQ'
  CARTORIO    = 'CARTORIO'
  PROTESTADO  = 'PROTESTADO'

  paginates_per  30
  default_scope -> { order(vencimento: :desc) }
  validates_presence_of :vencimento,
                        :valor,
                        :status

  belongs_to :cliente

  def vencido?
    self.status == ABERTO && DateTime.now > self.vencimento
  end

  def pago?
    self.status == PAGO
  end

  def em_cartorio?
    self.status == CARTORIO
  end

  def protestado?
    self.status == PROTESTADO
  end

end
