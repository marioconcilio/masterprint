class Cheque < ApplicationRecord
  paginates_per 30
  default_scope -> { order(:data_deposito, :banco, :numero, :valor) }

  validates_presence_of :banco,
                        :numero,
                        :emitente,
                        :valor,
                        :data_deposito,
                        :cliente,
                        :status

  belongs_to :cliente, optional: true
  belongs_to :deposito, optional: true

  def self.search(number)
    where("numero = #{number} AND deposito_id IS NULL")
  end

  def aberto?
    self.status == Financeiro::ChequesHelper::Aberto
  end

  def devolvido?
    self.status == Financeiro::ChequesHelper::Devolvido
  end

  def depositado?
    self.status == Financeiro::ChequesHelper::Depositado
  end

  def pago?
    self.status == Financeiro::ChequesHelper::Pago
  end

  private
    ransacker :numero_text do
      Arel.sql('numero::text')
    end

end
