modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "show") %>'

modalHeader = $('.modal .modal-header')
modalHeader.html '<h3>Realizado em <%= format_date(@deposito.created_at) %> </h3>'

modal = $('.modal')
modal.modal()
