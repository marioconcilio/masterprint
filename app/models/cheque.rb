class Cheque < ApplicationRecord
  validates_presence_of :banco,
                        :numero,
                        :emitente,
                        :valor

  belongs_to :cliente
end
