modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "form") %>'

modalHeader = $('.modal .modal-header')
modalHeader.html '<h3>Novo Químico</h3>'

modal = $('.modal')
modal.modal()
