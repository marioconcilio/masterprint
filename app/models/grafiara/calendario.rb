class Grafiara::Calendario < ApplicationRecord
  validates_presence_of :referencia,
                        :descricao,
                        :preco,
                        :un

  default_scope { order(pagina: :asc) }
end
