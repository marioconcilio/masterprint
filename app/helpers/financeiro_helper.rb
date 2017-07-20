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
      'label label-primary'
    elsif bill.aberto?
      'label label-default'
    elsif bill.pago?
      'label label-success'
    elsif bill.cartorio? || bill.protestado? || bill.titulo_maos?
      'label label-danger'
    elsif bill.vencido?
      'label label-warning'
    else
      'label label-default'
    end
  end

end
