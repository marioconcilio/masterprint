$('#ch_search').blur()

$('.modal-dialog').attr 'class', 'modal-dialog modal-lg'
$('.modal .modal-content').html '<%= j(render "choose") %>'
$('.modal').modal()

$('.form-cheque').on 'submit', ->
  modal.modal 'hide'
  return
