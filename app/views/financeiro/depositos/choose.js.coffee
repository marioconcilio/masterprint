$('#ch_search').blur()

modalContent = $('.modal .modal-content')
modalContent.html '<%= j(render "form_choose") %>'

modalHeader = $('.modal .modal-header')
modalHeader.html '<h3>Cheques nº <%= format_numero(@result.first.numero) %></h3>'

modal = $('.modal')
modal.modal()
