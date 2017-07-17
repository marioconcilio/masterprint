jQuery ->
  calculate = ->
    larg = parseInt $('#blanqueta_larg').val()
    comp = parseInt $('#blanqueta_comp').val()
    dolar = parseFloat $('#blanqueta_dolar').val()
    price = parseFloat $('#blanqueta_blanqueta_lona_id').find(':selected').attr('price')
    total = larg * comp * price * dolar / 1000000

    $('#blanqueta_total').text accounting.formatMoney(total.toFixed(1), 'R$ ', 2, '.', ',')
    return

  $('body').on 'keyup', '.blq-calculable', ->
    calculate()
    return

  $('body').on 'change', '#blanqueta_blanqueta_lona_id', ->
    calculate()
    return

$('#blanqueta_larg').mask '#'
$('#blanqueta_comp').mask '#'
