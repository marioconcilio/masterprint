class Tinta < ApplicationRecord
  validates_presence_of :nome,
                        :marca,
                        :preco_kg,
                        :qtde,
                        :un,
                        :moeda

  default_scope -> { order(marca: :asc, nome: :asc) }

  def preco_un
    "R$ %.2f" % (self.preco_kg * self.un).round(1)
  end

end
