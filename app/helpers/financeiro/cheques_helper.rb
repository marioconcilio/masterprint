module Financeiro::ChequesHelper

  def format_banco(number)
    '%03d' % number
  end

  def format_numero(number)
    '%06d' % number
  end

end
