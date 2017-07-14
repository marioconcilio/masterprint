module Financeiro::ChequesHelper

  def format_banco(number)
    number.nil? ? '-' : '%03d' % number
  end

  def format_numero(number)
    number.nil? ? '-' : '%06d' % number
  end

end
