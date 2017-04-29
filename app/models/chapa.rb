class Chapa < ApplicationRecord
  validates_presence_of :larg,
                        :comp,
                        :qtde,
                        :moeda

  belongs_to :chapa_marca

  default_scope -> { order(:larg, :comp) }

  def preco
    if self.moeda == 'USD'
      preco = self.chapa_marca.preco * ChapaDolar.first.value
    else
      preco = self.chapa_marca.preco
    end

    (self.larg * self.comp * preco / 1000000).round(1)
  end

  def preco_un
    'R$ %.2f' % self.preco
  end

  def preco_avulso
    'R$ %.2f' % (self.preco * 1.27).round(1)
  end

  def size
    '%03d x %03d' % [self.larg, self.comp]
  end

end
