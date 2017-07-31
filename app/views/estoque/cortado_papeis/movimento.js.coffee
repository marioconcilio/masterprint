$('.modal-dialog').attr 'class', 'modal-dialog modal-sm'
$('.modal .modal-content').html '<%= j(render "mov_form") %>'
$('.modal').modal()

