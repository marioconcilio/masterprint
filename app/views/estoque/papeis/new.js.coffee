$('.modal .modal-content').html '<%= j(render "form") %>'

modalHeader = $('.modal .modal-header')
modalHeader.html '<h3>Novo Papel</h3>'

$('.modal .modal-dialog').removeClass 'modal-sm'
$('.modal').modal()
