module Painel::RecadosHelper

  def texto_done_recado(rec)
    if rec.done?
      'strikethrough'
    end
  end

end
