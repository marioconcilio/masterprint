class Envelope < ApplicationRecord
  validates_presence_of :preco_milheiro,
                        :moeda,
                        :qtde,
                        :un,
                        :grs,
                        :larg,
                        :comp,
                        :tipo

  default_scope -> { order(:nome, :larg, :comp, :tipo, :grs) }

  def preco_un
    'R$ %.2f' % (self.preco_milheiro * self.un / 1000)
  end

  def size
    '%03d x %03d' % [self.larg, self.comp]
  end

end
