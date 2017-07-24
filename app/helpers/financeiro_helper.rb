module FinanceiroHelper
  Aguardando    = 'Aguardando'
  Aberto        = 'Em aberto'
  Pago          = 'Pago'
  Cartorio      = 'Cartório'
  Protesto      = 'Protestado'
  ProtestoMaos  = 'Protesto em mãos'

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
      'badge badge-primary'
    elsif bill.aberto?
      'badge badge-default'
    elsif bill.pago?
      'badge badge-success'
    elsif bill.cartorio? || bill.protestado? || bill.titulo_maos?
      'badge badge-danger'
    elsif bill.vencido?
      'badge badge-warning'
    else
      'badge badge-default'
    end
  end

end
