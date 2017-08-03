$('.modal-dialog').attr 'class', 'modal-dialog'
$('.modal .modal-content').html '<%= j(render "form") %>'
$('.modal').modal()
