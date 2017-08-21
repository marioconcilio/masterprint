module Financeiro::DepositosHelper

  def get_total_cheques(array)
    if array.nil?
      0
    else
      array.map { |ch| ch['valor'].to_f }.reduce(0, :+)
    end
  end

end
