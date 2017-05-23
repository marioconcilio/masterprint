module CadastroHelper

  def format_cnpj(number)
    ('%014d' % number).gsub(/\A(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})\Z/, "\\1.\\2.\\3/\\4-\\5")
  end

  def format_cep(number)
    ('%08d' % number).gsub(/\A(\d{5})(\d{3})\Z/, "\\1-\\2") if number
  end

end
