$('#modal-window').attr 'class', 'modal <%= cheque_modal @cheque %> fade'
$('.modal .modal-content').html '<%= j(render "show") %>'
$('.modal').modal()
