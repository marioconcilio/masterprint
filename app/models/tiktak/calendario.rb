class Tiktak::Calendario < ApplicationRecord
  enum tipo: {
    parede:       'De Parede',
    comercial:    'Linha Comercial',
    mesa:         'De Mesa',
    mini:         'Mini Calendário',
    carteira:     'Despachante/Risque Rabisque',
    cartao_natal: 'Cartão de Natal'
  }

  validates_presence_of :pagina,
                        :referencia,
                        :tipo,
                        :descricao,
                        :preco,
                        :un

  default_scope { order(pagina: :asc, referencia: :asc) }
  scope :t, -> (cal_tipo) { where('tipo like ?', Tiktak::Calendario.tipos[cal_tipo]) }

  paginates_per 20
end
