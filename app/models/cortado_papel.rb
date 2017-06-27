class CortadoPapel < ApplicationRecord
  validates_presence_of :nome,
                        :preco,
                        :qtde,
                        :un,
                        :moeda

  default_scope -> { order(:nome) }

  def preco_un
    if self.moeda == 'USD'
      (self.preco * Settings.dolar.papeis).round(1)
    else
      self.preco.round(1)
    end
  end

  def to_s
    self.nome
  end

  private
    ransacker :preco_un do
      Arel.sql('preco')
    end

end
