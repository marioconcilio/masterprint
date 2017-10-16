class Chapa < ApplicationRecord
  validates_presence_of :larg,
                        :comp,
                        :qtde,
                        :moeda

  belongs_to :chapa_marca

  default_scope -> { order(:larg, :comp) }

  def preco
    return 0 unless self.chapa_marca

    if self.moeda == 'USD'
      preco = self.chapa_marca.preco * Settings.dolar.chapas
    else
      preco = self.chapa_marca.preco
    end

    return (self.larg * self.comp * preco / 1000000).round(1)
  end

  def preco_avulso
    (self.preco * Settings.chapa.avulso).round(1)
  end

  def size
    '%03d x %03d' % [self.larg, self.comp]
  end

  private
    ransacker :preco_un do
      Arel.sql('larg * comp * chapa_marcas.preco')
    end

    ransacker :larg do
      Arel.sql('larg::text')
    end

    ransacker :comp do
      Arel.sql('comp::text')
    end

end
