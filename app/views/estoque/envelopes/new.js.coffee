modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "form") %>'

$('.modal').modal()
