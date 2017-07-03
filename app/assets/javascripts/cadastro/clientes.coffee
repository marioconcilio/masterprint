options = onKeyPress: (uf, event, currentField, options) ->
  currentField.val uf.toUpperCase()
  return

$('#cliente_id').mask '00.000.000/0000-00'
$('#cliente_uf').mask 'SS', options
$('#cliente_cep').mask '00000-000'
