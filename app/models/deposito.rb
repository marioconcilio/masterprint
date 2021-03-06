class Deposito < ApplicationRecord
  before_save :titleize_all

  paginates_per 30
  default_scope -> { order(created_at: :desc) }

  validates_numericality_of :total, greater_than: 0
  validates_presence_of :total,
                        :titular

  has_many :cheques, dependent: :destroy

  private
    def titleize_all
      self.titular = self.titular.titlecase
    end

end
