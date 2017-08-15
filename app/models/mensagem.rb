class Mensagem < ApplicationRecord
  belongs_to :remetente, class_name: 'Usuario'
  belongs_to :destinatario, class_name: 'Usuario'
end
