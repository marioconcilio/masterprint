module FinanceiroHelper

  def format_bill_number(id)
    number = id / 1000

    # 503
    if number == 0
      '%03d' % id
    # 503 001
    else
      parcel = id % 1000
      '%03d/%03d' % [number, parcel]
    end
  end

  def bill_label(bill)
    if bill.aguardando?
      'badge badge-info'
    elsif bill.pago?
      'badge badge-success'
    elsif bill.cartorio? || bill.baixado? || bill.protestado? || bill.titulo_maos?
      'badge badge-danger'
    elsif bill.vencido?
      'badge badge-warning'
    else
      'badge badge-default'
    end
  end

  def bill_modal(bill)
    if bill.aguardando?
      'modal-info'
    elsif bill.pago?
      'modal-success'
    elsif bill.cartorio? || bill.baixado? ||  bill.protestado? || bill.titulo_maos?
      'modal-danger'
    elsif bill.vencido?
      'modal-warning'
    else
      ''
    end
  end

end
