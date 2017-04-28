class BlanquetaLona < ApplicationRecord
  validates_presence_of :lonas,
                        :preco

  has_many :blanquetas, dependent: :destroy
end
