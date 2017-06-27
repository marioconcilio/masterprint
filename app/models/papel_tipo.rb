class PapelTipo < ApplicationRecord
  validates_presence_of :tipo,
                        :preco_kg,
                        :moeda

  has_many :papeis, dependent: :destroy

  default_scope { order(:tipo) }

  def to_s
    if self.descricao.nil?
      self.tipo
    else
      self.descricao
    end
  end

end
