class Usuario < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  before_validation :usuario_downcase

  validates_presence_of :nome,
                        :usuario,
                        :password

  validates_length_of :usuario, maximum: 50
  validates_length_of :password, minimum: 6

  validates_uniqueness_of :usuario
  has_many :recados

  def remember
    self.remember_token = Usuario.new_token
    update_attribute(:remember_digest, Usuario.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def inspect
    "Usuario(id: #{self.id}, usuario: #{self.usuario}, nome: #{self.nome}, object_id: #{"0x00%x" % (object_id << 1)})"
  end

  # class methods
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  private
    def usuario_downcase
      self.usuario = usuario.downcase if usuario
    end
end
