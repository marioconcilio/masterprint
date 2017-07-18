# phone mask
maskBehavior = (val) ->
  if val.replace(/\D/g, '').length == 11 then '(00) 00000-0000' else '(00) 0000-00009'

optionsPhone = onKeyPress: (val, e, field, options) ->
  field.mask maskBehavior.apply({}, arguments), options
  return

$('.phone').mask maskBehavior, optionsPhone

jQuery ->
  #slide up alert after delay
  # $('.alert').delay(2000).slideUp()

  # clickable table rows
  $('body').on 'click', 'tr[data-href]', ->
    window.location = $(this).data('href')
  return
