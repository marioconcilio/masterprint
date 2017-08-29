class GrafiaraFolhinha < ApplicationRecord
  validates_presence_of :referencia,
                        :descricao,
                        :un,
                        :preco
end
