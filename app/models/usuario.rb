class Usuario < ApplicationRecord
  has_secure_password
  before_validation :usuario_downcase

  validates_presence_of :nome,
                        :usuario,
                        :password

  validates_length_of :usuario, maximum: 50
  validates_length_of :password, minimum: 6

  validates_uniqueness_of :usuario

  private
    def usuario_downcase
      self.usuario = usuario.downcase if usuario
    end
end
