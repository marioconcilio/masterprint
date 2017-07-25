$('.modal .modal-content').html '<%= j(render "mov_form") %>'
$('.modal .modal-dialog').addClass 'modal-sm'
$('.modal').modal()
