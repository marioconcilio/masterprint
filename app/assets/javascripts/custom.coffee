jQuery ->
  # clickable table rows
  $('body').on 'click', 'tr[data-href]', ->
    window.location = $(this).data('href')
    return
