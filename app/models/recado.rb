class Recado < ApplicationRecord
  validates_presence_of :titulo,
                        :texto,
                        :remetente

  belongs_to :remetente, class_name: 'Usuario'
  belongs_to :destinatario, class_name: 'Usuario'

  default_scope { order(updated_at: :desc) }
end
