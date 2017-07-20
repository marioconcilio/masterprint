class Cheque < ApplicationRecord
  enum status: {
    aberto:     'Em aberto',
    devolvido:  'Devolvido',
    depositado: 'Depositado',
    pago:       'Pago'
  }

  before_save :titleize_all
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

  private
    ransacker :numero_text do
      Arel.sql('numero::text')
    end

    def titleize_all
      self.emitente = self.emitente.titlecase
    end

end
