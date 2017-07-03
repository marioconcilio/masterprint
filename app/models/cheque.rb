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

  private
    ransacker :numero do
      Arel.sql('numero::text')
    end

end
