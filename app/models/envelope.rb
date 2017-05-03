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
    (self.preco_milheiro * self.un / 1000)
  end

  def size
    '%03d x %03d' % [self.larg, self.comp]
  end

  private
    ransacker :preco_un do
      Arel.sql('preco_milheiro * un / 1000')
    end

    ransacker :larg do
      Arel.sql('larg::text')
    end

    ransacker :comp do
      Arel.sql('comp::text')
    end

    ransacker :grs do
      Arel.sql('grs::text')
    end

end
