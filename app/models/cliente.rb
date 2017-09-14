class Cliente < ApplicationRecord
  before_save :titleize_all
  paginates_per  30
  default_scope -> { order(:nome, :razao_social) }

  validates_presence_of :nome,
                        :contato

  has_many :recebimentos, dependent: :destroy
  has_many :cheques, dependent: :destroy

  def to_s
    self.nome
  end

  private
    def titleize_all
      self.razao_social = self.razao_social.titlecase
      self.endereco = self.endereco.titlecase
      self.cidade = self.cidade.titlecase
      self.nome = self.nome.titlecase
      self.contato = self.contato.titlecase
    end

    ransacker :nome, type: :string do
      Arel.sql 'unaccent("nome")'
    end

end
