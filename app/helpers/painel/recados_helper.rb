module Painel::RecadosHelper

  def recado_card_class(rec)
    if rec.done?
      'card-inverse card-success'
    else
      'card-inverse card-danger' if rec.updated_at < 1.week.ago
    end
  end

  def recado_card_text(rec)
    'text-muted' if rec.done?
  end

  def recado_card_icon(rec)
    'text-white' if rec.updated_at < 1.week.ago
  end

end
