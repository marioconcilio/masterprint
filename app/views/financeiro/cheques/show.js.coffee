modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "show") %>'

modalHeader = $('.modal .modal-header')
modalHeader.html '<h3>Cheque nº <%= format_numero @cheque.numero %> </h3>'

modal = $('.modal')
modal.modal()
