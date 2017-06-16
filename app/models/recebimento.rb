class Recebimento < ApplicationRecord
  paginates_per 50
  default_scope -> { order(vencimento: :desc) }
  scope :status, -> (status) { where('status ilike ?', status) }

  validates_presence_of :vencimento,
                        :valor,
                        :status

  belongs_to :cliente

  def vencido?
    self.status == FinanceiroHelper::Aberto && DateTime.now > self.vencimento
  end

  def pago?
    self.status == FinanceiroHelper::Pago
  end

  def em_cartorio?
    self.status == FinanceiroHelper::Cartorio
  end

  def protestado?
    self.status == FinanceiroHelper::Protesto
  end

  private
    ransacker :numero do
      Arel.sql 'recebimentos.id::text'
    end

    ransacker :numero_order do
      Arel.sql 'recebimentos_order(recebimentos.id)'
    end

end
