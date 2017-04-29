class Variado < ApplicationRecord
  validates_presence_of :nome,
                        :preco,
                        :qtde,
                        :un,
                        :moeda

  default_scope -> { order(:nome) }

  def preco_un
    if self.moeda == 'USD'
      dolar = Dolar.first.value
      "R$ %.2f" % (self.preco * dolar).round(1)
    else
      "R$ %.2f" % self.preco.round(1)
    end
  end

end
