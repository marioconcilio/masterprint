class Quimico < ApplicationRecord
  validates_presence_of :nome,
                        :marca,
                        :un,
                        :preco,
                        :moeda,
                        :qtde
end
