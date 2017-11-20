require 'nokogiri'

module Financeiro::PagSeguroHelper

  def pagseguro_import(xml_file)
    doc = File.open(xml_file) { |f| Nokogiri::XML(f) }
    arr = []
    doc.css('Table').each do |card|
      next if card.css('Tipo_Transacao').text != 'Pagamento'

      transacao_id = card.css('Transacao_ID').text
      tipo_pagamento = card.css('Tipo_Pagamento').text
      valor_bruto = string_to_decimal(card.css('Valor_Bruto').text)
      valor_taxa = string_to_decimal(card.css('Valor_Taxa').text)
      valor_liquido = string_to_decimal(card.css('Valor_Liquido').text)
      data = card.css('Data_Transacao').text
      parcelas = card.css('Parcelas').text.to_i
      bandeira = card.at_css('Bandeira_Cartao_Credito')? card.css('Bandeira_Cartao_Credito').text : 'Outro'

      arr.push Financeiro::PagSeguro.new(
        id: transacao_id,
        tipo_pagamento: tipo_pagamento,
        valor_bruto: valor_bruto,
        valor_taxa: valor_taxa,
        valor_liquido: valor_liquido,
        data: data,
        parcelas: parcelas,
        bandeira: bandeira)

    end

    return arr
  end

  def pagseguro_bandeira(card)
    if card.credito?
      card.bandeira
    else
      'Débito'
    end
  end

  private
    def string_to_decimal(str)
      str.gsub(/[.,]/, '.' => '', ',' => '.').to_f
    end

end
