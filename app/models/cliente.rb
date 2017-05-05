class Cliente < ApplicationRecord
  validates_presence_of :nome,
                        :endereco,
                        :cidade,
                        :uf,
                        :cep
end
