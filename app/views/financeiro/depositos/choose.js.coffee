$('#ch_search').blur()

modal = $('#modal-window-lg')
modal.attr 'class', 'modal fade'
modal.find('.modal-content').html '<%= j(render "choose") %>'
modal.modal()

$('.form-cheque').on 'submit', ->
  modal.modal 'hide'
  return
