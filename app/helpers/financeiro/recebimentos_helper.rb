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

    dict = {}
    lines.each do |l|
      num = l[21..27].to_i
      next if dict[num] =~ /LC|LP|LQ|BX/
      dict[num] = l[83..85]
    end

    return dict
  end

  def status_from_sit(sit)
    if sit == 'BXP'
      :protestado
    elsif sit =~ /BX/
      :baixado
    elsif sit =~ /LC|LP|LQ/
      :pago
    elsif sit == 'TEC'
      :cartorio
    elsif sit =~ /RG/
      :aberto
    else
      nil
    end
  end

  def write_to_cache(ret)
    $redis[cache_name] = ret.to_json
  end

  def read_cache
    JSON.load($redis[cache_name])
  end

  def clear_cache
    $redis.del(cache_name)
  end

  def get_ocorrencia(id)
    Ocorrencia.find_by_codigo(@list[id.to_s]).descricao
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

    def cache_name
      "#{session[:user_id]}_retorno"
    end

end
