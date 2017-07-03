class Deposito < ApplicationRecord
  paginates_per 30
  default_scope -> { order(created_at: :desc) }

  validates_presence_of :total,
                        :banco,
                        :agencia,
                        :conta,
                        :titular

  has_many :cheques, dependent: :destroy
end
