class Envelope < ApplicationRecord
  validates_presence_of :preco_milheiro,
                        :moeda,
                        :qtde,
                        :un,
                        :grs,
                        :larg,
                        :comp,
                        :tipo

  default_scope -> { order(tipo: :asc) }

  def preco_un
    "R$ %.2f" % (self.preco_milheiro * self.un / 1000)
  end

end
