modal = $('#modal-window')
modal.attr 'class', 'modal <%= bill_modal @recebimento %> fade'
modal.find('.modal-content').html '<%= j(render "form") %>'
modal.modal()
