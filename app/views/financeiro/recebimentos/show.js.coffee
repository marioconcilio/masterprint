$('#modal-window').attr 'class', 'modal <%= bill_modal @recebimento %> fade'
$('.modal .modal-content').html '<%= j(render "form") %>'
$('.modal').modal()
