modal = $('#modal-window-sm')
modal.attr 'class', 'modal fade'
modal.find('.modal-content').html '<%= j(render "mov_form") %>'
modal.modal()
