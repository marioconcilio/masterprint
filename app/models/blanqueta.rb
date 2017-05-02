class Blanqueta < ApplicationRecord
  validates_presence_of :larg,
                        :comp,
                        :qtde,
                        :moeda,
                        :nome

  belongs_to :blanqueta_lona

  default_scope -> { order(:larg, :comp) }

  def preco_un
    if self.moeda == 'USD'
      preco = self.blanqueta_lona.preco * Settings.dolar.blanquetas
    else
      preco = self.blanqueta_lona.preco
    end

    (self.larg * self.comp * preco / 1000000).round(1)
  end

  def size
    '%03d x %03d' % [self.larg, self.comp]
  end

  private
    ransacker :preco_un do
      Arel.sql('larg * comp * blanqueta_lonas.preco')
    end

    ransacker :larg do
      Arel.sql('larg::text')
    end

    ransacker :comp do
      Arel.sql('comp::text')
    end

end
