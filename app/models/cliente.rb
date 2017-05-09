class Cliente < ApplicationRecord
  paginates_per  30

  validates_presence_of :nome,
                        :endereco,
                        :cidade,
                        :uf,
                        :cep
end
