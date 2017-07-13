modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "new") %>'

modalHeader = $('.modal .modal-header')
modalHeader.html '<h3>Novo Cheque</h3>'

modal = $('.modal')
modal.modal()
