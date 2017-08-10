module Financeiro::RecebimentosHelper

  REM_LINE1 = '90019008869'
  REM_LINE2 = '0000000000000000000000012345678'

  def process_remessa(file)
    lines = File.readlines(file)
    lines.select! { |line| line.include?(REM_LINE1) || line.include?(REM_LINE2) }
    recebimentos = lines.each_slice(2).map { |line| recover_recebimento(line) }
  end

  def process_retorno(file)
    lines = File.readlines(file)[9..-6]
    l = lines[0].strip
    num = l[21..27].to_i
    sit = l[83..85]
  end

  private
    def recover_recebimento(line)
      splitted = line[0].split(/\s+/)
      num = splitted[3][5..-1].to_i
      date = Date.strptime(splitted[4][0..7], '%d%m%Y')
      value = (splitted[4][8..22].to_f) / 100.0
      cnpj = line[1][19..33].to_i

      Recebimento.new(
        id: num,
        vencimento: date,
        valor: value,
        cliente_id: cnpj,
        status: :aguardando)
    end

end
