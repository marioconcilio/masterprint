class CortadoPapel < ApplicationRecord
  paginates_per 10
  validates_presence_of :nome,
                        :preco,
                        :qtde,
                        :un,
                        :moeda

  default_scope -> { order(:nome) }
  scope :tipo, -> (tipo) { where('nome ilike ?', "%#{tipo}%") }

  def preco_un
    if self.moeda == 'USD'
      (self.preco * Settings.dolar.papeis).round(1)
    else
      self.preco.round(1)
    end
  end

  def to_s
    self.nome
  end

  private
    ransacker :preco_un do
      Arel.sql('preco')
    end

end
