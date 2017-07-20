class Quimico < ApplicationRecord
  validates_presence_of :nome,
                        :marca,
                        :un,
                        :preco,
                        :moeda,
                        :qtde

  default_scope -> { order(:nome, :marca, :un) }

  def preco_un
    if self.moeda == 'USD'
      (self.preco * Settings.dolar.quimicos).round(1)
    else
      self.preco.round(1)
    end
  end

  private
    ransacker :preco_un do
      Arel.sql('preco')
    end

end
