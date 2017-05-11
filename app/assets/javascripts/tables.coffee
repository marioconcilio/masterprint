# clickable rows
jQuery ->
  $('body').on 'click', 'tr[data-href]', ->
    window.location = $(this).data('href')
  return
