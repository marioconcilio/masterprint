jQuery ->
  calculate = ->
    un = parseFloat $('#envelope_un').val().replace(',', '.')
    mil = parseFloat $('#envelope_preco_milheiro').val().replace('.', '').replace(',', '.')
    dolar = parseFloat $('#envelope_dolar').val()
    currency = $('#envelope_moeda').val()

    if currency == 'USD'
      total = un * mil * dolar / 1000
    else
      total = un * mil / 1000

    $('#envelope_total').text accounting.formatMoney(total, 'R$ ', 2, '.', ',')
    return

  $('body').on 'keyup', '.calculable', ->
    calculate()
    return

  $('body').on 'change', '#envelope_moeda', ->
    calculate()
    return

  $('#envelope_un').mask '#'
  $('#envelope_preco_milheiro').mask '#.##0,00', reverse: true, placeholder: '0,00'
