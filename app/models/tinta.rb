class Tinta < ApplicationRecord
  paginates_per 10
  validates_presence_of :nome,
                        :marca,
                        :preco_kg,
                        :qtde,
                        :un,
                        :moeda

  default_scope -> { order(:marca, :nome) }

  def preco_un
    preco = self.preco_kg * self.un
    if self.moeda == 'USD'
      (preco * Settings.dolar.tintas).round(1)
    else
      preco.round(1)
    end
  end

  private
    ransacker :preco_un do
      Arel.sql('preco_kg * un')
    end

end
