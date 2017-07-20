modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "show") %>'

modal = $('.modal')
modal.modal()
