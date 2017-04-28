class Envelope < ApplicationRecord
  validates_presence_of :preco_milheiro,
                        :moeda,
                        :qtde,
                        :un,
                        :grs,
                        :larg,
                        :comp,
                        :tipo
end
