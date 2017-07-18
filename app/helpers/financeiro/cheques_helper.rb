module Financeiro::ChequesHelper
  Aberto      = 'Em aberto'
  Devolvido   = 'Devolvido'
  Depositado  = 'Depositado'
  Pago        = 'Pago'

  def format_banco(number)
    number.nil? ? '-' : '%03d' % number
  end

  def format_numero(number)
    number.nil? ? '-' : '%06d' % number
  end

  def cheque_status(ch)
    if ch.devolvido?
      'danger'
    elsif ch.depositado?
      'success'
    elsif ch.pago?
      'success'
    end
  end

end
