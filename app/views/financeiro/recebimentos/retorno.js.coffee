modal = $('#modal-window')
modal.attr 'class', 'modal fade'
modal.find('.modal-content').html '<%= j(render "form_file") %>'
modal.find('.modal-title strong').html 'Retorno'

formAction = $('.modal .modal-content form')[0]
formAction.action = '/financeiro/recebimentos/retorno'

modal.modal()

$(':file').filestyle
  buttonText: 'Escolher Arquivo'
  buttonName: 'btn-primary'
  buttonBefore: false
  icon: false
