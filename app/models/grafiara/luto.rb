class Grafiara::Luto < ApplicationRecord
  validates_presence_of :pagina,
                        :referencia,
                        :descricao,
                        :preco,
                        :un,
                        :qtde

  default_scope { order(referencia: :asc, pagina: :asc) }
  paginates_per 20
end
