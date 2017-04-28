class Variado < ApplicationRecord
  validates_presence_of :nome,
                        :preco,
                        :qtde,
                        :un,
                        :moeda
end
