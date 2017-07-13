class Cheque < ApplicationRecord
  paginates_per 30
  default_scope -> { order(:data_deposito, :banco, :numero, :valor) }

  validates_presence_of :banco,
                        :numero,
                        :emitente,
                        :valor,
                        :data_deposito

  belongs_to :cliente, optional: true
  belongs_to :deposito, optional: true

  def self.search(number)
    where("numero = #{number} AND deposito_id IS NULL")
  end

  private
    ransacker :numero_text do
      Arel.sql('numero::text')
    end

end
