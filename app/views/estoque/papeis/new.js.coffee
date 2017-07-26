$('.modal .modal-content').html '<%= j(render "form") %>'
$('.modal .modal-dialog').removeClass 'modal-sm'
$('.modal').modal()
