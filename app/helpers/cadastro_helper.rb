module CadastroHelper

  def format_cnpj(number)
    if number
      ('%014d' % number).gsub(/\A(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})\Z/, "\\1.\\2.\\3/\\4-\\5")
    end
  end

  def format_cep(number)
    if number
      ('%08d' % number).gsub(/\A(\d{5})(\d{3})\Z/, "\\1-\\2")
    end
  end

  def format_ie(number)
    if number
      ('%012d' % number).gsub(/\A(\d{3})(\d{3})(\d{3})(\d{3})\Z/, "\\1.\\2.\\3.\\4")
    end
  end

end
