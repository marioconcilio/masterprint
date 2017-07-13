$('#cheques-tableview').html '<%= j(render("cheques")) %>'
$('#deposito_total').val('<%= get_total %>')
$('#deposito_total_static').text accounting.formatMoney('<%= get_total %>', 'R$ ', 2, '.', ',')
$('#ch_search').val('')
$('#ch_search').blur()
