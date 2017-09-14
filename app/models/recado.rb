class Recado < ApplicationRecord
  validates_presence_of :titulo,
                        :texto,
                        :remetente

  belongs_to :remetente,    class_name: 'Usuario'
  belongs_to :destinatario, class_name: 'Usuario', optional: true

  default_scope { order(done: :asc, updated_at: :desc) }

  private
    ransacker :titulo, type: :string do
      Arel.sql 'unaccent("titulo")'
    end

end
