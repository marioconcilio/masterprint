#
# date field
#
$('.date-field').mask '00/00/0000', placeholder: '__/__/____'

#
# number field
#
$('.number-field').mask '#'

#
# money field
#
$('.money-field').mask '#.##0,00', reverse: true, placeholder: '0,00'

#
# cep field
#
$('.cep-field').mask '00000-000'

#
# cnpj field
#
$('.cnpj-field').mask '00.000.000/0000-00'

#
# ie field
#
$('.ie-field').mask '000.000.000.000'

#
# phone field
#
phoneMaskBehavior = (val) ->
  if val.replace(/\D/g, '').length == 11 then '(00) 00000-0000' else '(00) 0000-00009'

phoneOptions = onKeyPress: (val, e, field, options) ->
  field.mask phoneMaskBehavior.apply({}, arguments), options
  return

$('.phone-field').mask phoneMaskBehavior, phoneOptions

#
# uf field
#
optionsUf = onKeyPress: (uf, event, currentField, options) ->
  currentField.val uf.toUpperCase()
  return

$('.uf-field').mask 'SS', optionsUf
