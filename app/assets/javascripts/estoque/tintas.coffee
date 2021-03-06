jQuery ->
  calculate = ->
    un = parseFloat $('#tinta_un').val().replace(',', '.')
    kg = parseFloat $('#tinta_preco_kg').val().replace('.', '').replace(',', '.')
    dolar = parseFloat $('#tinta_dolar').val()
    currency = $('#tinta_moeda').val()

    if currency == 'USD'
      total = un * kg * dolar
    else
      total = un * kg

    $('#tinta_total').text accounting.formatMoney(total.toFixed(1), 'R$ ', 2, '.', ',')
    return

  $('body').on 'keyup', '.tin-calculable', ->
    calculate()
    return

  $('body').on 'change', '#tinta_moeda', ->
    calculate()
    return

$('#tinta_un').mask '#0,0', reverse: true, placeholder: '0,0 kg'
