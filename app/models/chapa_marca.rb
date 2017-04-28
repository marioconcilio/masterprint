class ChapaMarca < ApplicationRecord
  validates_presence_of :marca,
                        :preco,
                        :esp

  has_many :chapas, dependent: :destroy
end
