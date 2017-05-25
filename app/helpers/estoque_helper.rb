module EstoqueHelper

  Moeda = Struct.new(:value, :text)

  def moedas
    brl = Moeda.new('BRL', 'R$')
    usd = Moeda.new('USD', 'US$')

    return [brl, usd]
  end

end
