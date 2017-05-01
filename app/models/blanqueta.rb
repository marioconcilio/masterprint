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
      preco = self.blanqueta_lona.preco * Dolar.first.value
    else
      preco = self.blanqueta_lona.preco
    end

    'R$ %.2f' % (self.larg * self.comp * preco / 1000000).round(1)
  end

  def size
    '%03d x %03d' % [self.larg, self.comp]
  end

  def self.search(term)
    if term
      where('nome ILIKE ?', "%#{term}%")
    else
      all
    end
  end

end
