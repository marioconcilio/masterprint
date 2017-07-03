module FinanceiroHelper
  Aberto   = 'Em aberto'
  Pago     = 'Pago'
  Cartorio = 'Cartório'
  Protesto = 'Protestado'

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

  def bill_status(bill)
    if bill.pago?
      'paid'
    elsif bill.em_cartorio?
      'court'
    elsif bill.protestado?
      'protested'
    elsif bill.vencido?
      'overdue'
    else
      'open'
    end
  end

end
