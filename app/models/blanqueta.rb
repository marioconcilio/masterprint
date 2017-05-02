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

  def self.search(term)
    if term
      if is_numeric? term
        where('nome ILIKE ? or larg=? or comp=?', "%#{term}%", term.to_i, term.to_i)
      else
        where('nome ILIKE ?', "%#{term}%")
      end
    else
      all
    end
  end

end
