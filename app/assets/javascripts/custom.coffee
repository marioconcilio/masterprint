jQuery ->
  # clickable table rows
  $('body').on 'click', 'tr[data-href]', ->
    window.location = $(this).data('href')
    return

  $('.modal').on 'click', 'input[type="submit"]', ->
    $('.modal').modal('hide')
    return

  $('#clear-searchfield').on 'click', ->
    $('input.form-control').val ''
    return
