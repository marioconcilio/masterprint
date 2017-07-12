modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "form_choose") %>'

modalHeader = $('.modal .modal-header')
modalHeader.html '<h3>Escolha o cheque</h3>'

modal = $('.modal')
modal.modal()
