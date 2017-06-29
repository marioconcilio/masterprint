$ ->
  # hide spinner
  $('.spinner').hide()

  # show spinner on AJAX start
  ajaxLoadTimeout = undefined
  $(document).ajaxStart(->
    ajaxLoadTimeout = setTimeout((->
      $('.spinner').show()
      return
    ), 500)
    return
  ).ajaxSuccess ->
    clearTimeout ajaxLoadTimeout
    $('.spinner').hide()
    return

  # hide spinner on AJAX stop
  $(document).ajaxStop ->
    $('.spinner').hide()
    return

  $(document).on 'page:fetch', ->
    $('.spinner').show()
    return

  $(document).on 'page:receive', ->
    $('.spinner').hide()
    return
