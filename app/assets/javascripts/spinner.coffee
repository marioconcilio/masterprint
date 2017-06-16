$ ->
  # hide spinner
  $('.spinner').hide()

  # show spinner on AJAX start
  $(document).ajaxStart ->
    $('.spinner').show()
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
