class Cliente < ApplicationRecord
  paginates_per  30
  default_scope -> { order(:nome) }

  validates_presence_of :nome,
                        :contato

  has_many :recebimentos, dependent: :destroy
  has_many :cheques, dependent: :destroy

  def to_s
    self.nome
  end

end
