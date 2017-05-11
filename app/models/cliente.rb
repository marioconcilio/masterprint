class Cliente < ApplicationRecord
  paginates_per  30

  default_scope -> { order(:nome) }

  validates_presence_of :nome,
                        :endereco,
                        :cidade,
                        :uf,
                        :cep
end
