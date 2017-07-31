$('.modal .modal-content').html '<%= j(render "form") %>'
$('.modal .modal-header').html '<%= modal_form_header "Editando", "Cliente" %>'
$('.modal').modal()
