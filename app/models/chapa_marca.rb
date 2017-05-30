class ChapaMarca < ApplicationRecord
  validates_presence_of :marca,
                        :preco,
                        :esp

  has_many :chapas, dependent: :destroy

  def marca_and_esp
    "#{self.marca} (#{self.esp})"
  end

end
