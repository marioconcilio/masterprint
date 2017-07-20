module Financeiro::ChequesHelper

  def format_banco(number)
    number.nil? ? '-' : '%03d' % number
  end

  def format_numero(number)
    number.nil? ? '-' : '%06d' % number
  end

  def cheque_label(ch)
    if ch.devolvido?
      'label label-danger'
    elsif ch.depositado? || ch.pago?
      'label label-success'
    else
      'label label-default'
    end
  end

end
