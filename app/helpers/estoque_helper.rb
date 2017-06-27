module EstoqueHelper

  Moeda = Struct.new(:value, :text)

  def moedas
    brl = Moeda.new('BRL', 'R$')
    usd = Moeda.new('USD', 'US$')

    return [brl, usd]
  end

  def qty_class(product)
    if product.qtde <= 0
      'danger'
    else
      ''
    end
  end

end
