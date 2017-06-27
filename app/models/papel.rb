class Papel < ApplicationRecord
  validates_presence_of :grs,
                        :larg,
                        :comp,
                        :fls,
                        :peso,
                        :qtde

  belongs_to :papel_tipo

  default_scope { order('papel_tipos.tipo',
                        :subtipo,
                        :grs,
                        :larg,
                        :comp,
                        :fls,
                        :marca) }

  scope :tipo, -> (tipo) { where('papel_tipos.tipo ilike ?', "#{tipo}%") }

  def preco_un
    if self.papel_tipo.moeda == 'USD'
      preco = self.papel_tipo.preco_kg * Settings.dolar.papeis
    else
      preco = self.papel_tipo.preco_kg
    end

    (self.peso * preco).round(0)
  end

  def size
    '%d x %d' % [self.larg, self.comp]
  end

  def to_s
    "#{self.papel_tipo} #{self.subtipo} #{self.grs}g #{size} #{self.fls}fls #{self.marca}"
  end

  private
    ransacker :preco_un do
      Arel.sql('peso * papel_tipos.preco_kg')
    end

    ransacker :grs do
      Arel.sql('grs::text')
    end

end
