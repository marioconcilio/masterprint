module FlashHelper

  def flash_type(key)
    key.gsub('alert', 'error').gsub('notice', 'info')
  end

  def flash_title(key)
    title = {
      success: 'Sucesso',
      info: 'Info',
      warning: 'Atenção',
      error: 'Erro'
    }

    return title[key.to_sym]
  end

end
