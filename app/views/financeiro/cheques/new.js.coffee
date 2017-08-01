$('#modal-window').attr 'class', 'modal fade'
$('.modal .modal-content').html '<%= j(render "new") %>'
$('.modal').modal()
