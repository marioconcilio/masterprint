jQuery ->
  $('body').on 'click', '#mov_entrada', ->
    $('#mov_saida').prop('checked', !this.checked)
    return

  $('body').on 'click', '#mov_saida', ->
    $('#mov_entrada').prop('checked', !this.checked)
    return
