$('#cheques-tableview').html '<%= j(render("cheques")) %>'
$('#deposito_total').val('<%= get_total_cheques(@cheques) %>')
$('#deposito_total_static').text accounting.formatMoney('<%= get_total_cheques(@cheques) %>', 'R$ ', 2, '.', ',')
$('#ch_search').val('')
$('#ch_search').blur()
