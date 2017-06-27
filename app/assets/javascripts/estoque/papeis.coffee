jQuery ->
  calculate = ->
    grs = parseInt $('#papel_grs').val()
    larg = parseInt $('#papel_larg').val()
    comp = parseInt $('#papel_comp').val()
    fls = parseInt $('#papel_fls').val()

    kg = parseFloat $('#papel_papel_tipo_id').find(':selected').attr('price')
    $('#papel_kg').text(accounting.formatMoney(kg, 'R$ ', 2, '.', ','))

    peso = grs * larg * comp * fls / 10000000
    if (isNaN(peso))
      $('#papel_peso_static').text('0,000 kg')
      $('#papel_peso').val(null)
      $('#papel_total').text('R$ 0,00')
    else
      total = peso * kg
      $('#papel_peso_static').text(peso.toFixed(3).replace('.', ',') + ' kg')
      $('#papel_peso').val(peso)
      $('#papel_total').text(accounting.formatMoney(total.toFixed(0), 'R$ ', 2, '.', ','))

    return

  $('body').on 'keyup', '.ppl-calculable', ->
    calculate()
    return

  $('body').on 'change', '#papel_papel_tipo_id', ->
    calculate()
    return

  $('#papel_grs').mask '#'
  $('#papel_larg').mask '#'
  $('#papel_comp').mask '#'
  $('#papel_fls').mask '#'
