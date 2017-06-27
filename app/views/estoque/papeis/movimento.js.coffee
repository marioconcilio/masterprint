modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "mov_form") %>'

modal = $('.modal')
modal.modal()

