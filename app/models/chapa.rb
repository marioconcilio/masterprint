class Chapa < ApplicationRecord
  validates_presence_of :larg,
                        :comp,
                        :qtde,
                        :moeda

  belongs_to :chapa_marca
end
