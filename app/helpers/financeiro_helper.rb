module FinanceiroHelper

  def format_date(date)
    date.strftime('%d/%m/%y')
  end

  def format_id(id)
    number = id / 1000

    # 503
    if number == 0
      '%03d' % id
    # 503 001
    else
      parcel = id % 1000
      '%03d %03d' % [number, parcel]
    end
  end

  def row_status(bill)
    if bill.pago?
      'success'
    elsif bill.em_cartorio?
      'warning'
    elsif bill.protestado?
      'danger'
    elsif bill.vencido?
      'info'
    end
  end

end
