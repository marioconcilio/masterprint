modal = $('#modal-window')
modal.attr 'class', 'modal <%= cheque_modal @cheque %> fade'
modal.find('.modal-content').html '<%= j(render "show") %>'
modal.modal()
