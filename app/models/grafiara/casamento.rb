class Grafiara::Casamento < ApplicationRecord
  validates_presence_of :codigo,
                        :descricao,
                        :preco,
                        :un

  default_scope { order(pagina: :asc, codigo: :asc) }
  paginates_per 20
end
