module Financeiro::ChequesHelper

  def format_banco(number)
    number.nil? ? '-' : '%03d' % number
  end

  def format_numero(number)
    number.nil? ? '-' : '%06d' % number
  end

  def cheque_label(ch)
    if ch.devolvido?
      'badge badge-danger'
    elsif ch.depositado? || ch.pago?
      'badge badge-success'
    else
      'badge badge-default'
    end
  end

  def cheque_modal(ch)
    if ch.devolvido?
      'modal-danger'
    elsif ch.depositado? || ch.pago?
      'modal-success'
    else
      ''
    end
  end

end
