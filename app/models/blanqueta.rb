class Blanqueta < ApplicationRecord
  validates_presence_of :larg,
                        :comp,
                        :qtde,
                        :moeda,
                        :nome

  belongs_to :blanqueta_lona
end
