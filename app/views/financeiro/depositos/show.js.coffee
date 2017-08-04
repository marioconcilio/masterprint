modal = $('#modal-window-lg')
modal.attr 'class', 'modal fade'
modal.find('.modal-content').html '<%= j(render "show") %>'
modal.modal()
