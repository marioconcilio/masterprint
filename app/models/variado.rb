class Variado < ApplicationRecord
  validates_presence_of :nome,
                        :preco,
                        :qtde,
                        :un,
                        :moeda

  default_scope -> { order(nome: :asc) }

  def preco_un

  end

end
