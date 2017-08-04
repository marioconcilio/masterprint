modal = $('#modal-window')
modal.attr 'class', 'modal fade'
modal.find('.modal-content').html '<%= j(render "new") %>'
modal.modal()
