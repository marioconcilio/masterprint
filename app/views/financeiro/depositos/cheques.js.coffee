$('#cheques-tableview').html '<%= j(render("cheques")) %>'
$('#deposito_total').val('<%= dpo_get_total %>')
$('#deposito_total_static').text accounting.formatMoney('<%= dpo_get_total %>', 'R$ ', 2, '.', ',')
$('#ch_search').val('')
$('#ch_search').blur()
