class Tinta < ApplicationRecord
  validates_presence_of :nome,
                        :marca,
                        :preco_kg,
                        :qtde,
                        :un,
                        :moeda

  default_scope -> { order(marca: :asc, nome: :asc) }

  def preco_un
    preco = self.preco_kg * self.un
    if self.moeda == 'USD'
      dolar = Dolar.first.value
      "R$ %.2f" % (preco * dolar).round(1)
    else
      "R$ %.2f" % preco.round(1)
    end
  end

end
