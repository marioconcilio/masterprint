class Tinta < ApplicationRecord
  validates_presence_of :nome,
                        :marca,
                        :preco_kg,
                        :qtde,
                        :un,
                        :moeda
end
