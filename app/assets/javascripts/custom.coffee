$(document).on 'ready page:change', ->
  $('[data-toggle="tooltip"]').tooltip()
  return

jQuery ->
  #slide up alert after delay
  # $('.alert').delay(2000).slideUp()

  # clickable table rows
  $('body').on 'click', 'tr[data-href]', ->
    window.location = $(this).data('href')
  return
