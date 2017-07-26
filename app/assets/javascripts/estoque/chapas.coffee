jQuery ->
  calculate = ->
    larg = parseInt $('#chapa_larg').val()
    comp = parseInt $('#chapa_comp').val()
    dolar = parseFloat $('#chapa_dolar').val()
    price = parseFloat $('#chapa_chapa_marca_id').find(':selected').attr('price')
    total = larg * comp * price * dolar / 1000000

    $('#chapa_total').text accounting.formatMoney(total.toFixed(1), 'R$ ', 2, '.', ',')
    return

  $('body').on 'keyup', '.chp-calculable', ->
    calculate()
    return

  $('body').on 'change', '#chapa_chapa_marca_id', ->
    calculate()
    return
