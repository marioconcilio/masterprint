jQuery ->
  title =
    success:  'Sucesso'
    info:     'Info'
    warning:  'Atenção'
    error:    'Erro'

  showFlashMessages = (jqXHR) ->
    if !jqXHR or !jqXHR.getResponseHeader
      return

    flash = jqXHR.getResponseHeader('X-Flash')
    flash = JSON.parse(flash)
    _.each flash, (message, key) ->
      toastr[key] message, title[key],
        'closeButton': true,
        'progressBar': true

  $(document).ajaxComplete (event, xhr, settings) ->
    showFlashMessages(xhr)
    return
