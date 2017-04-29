class Quimico < ApplicationRecord
  validates_presence_of :nome,
                        :marca,
                        :un,
                        :preco,
                        :moeda,
                        :qtde

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
